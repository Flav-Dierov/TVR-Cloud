#!/bin/bash

# Details
hostname="flaavf.dev"
password="Gw1-WO1vuN7"
username="Flavian"
subdomain_cloud="cloud." # Replace with cloud subdomain
subdomain_main="server1." # Replace with dedicated main subdomain
subdomain_backup="server2." # Replace with dedicated backup subdomain

# Configuration
current_system="main" # "main" or "backup"
timeout_main=5 # Minutes to wait before marking main as unavailable
timeout_backup=5 # Minutes to wait before marking backup as unavailable

# Global Variables
fail_count_main=0
fail_count_backup=0
availability_main="true"
availability_backup="true"

# Updates the DNS record to point to the current IP
# $1 - Subdomain to be updated
update_subdomain() {
    ip=$(external-ip)
    if [ -z "$ip" ]; then
      echo "[ERROR] - $(date): Failed to retrieve external IP." >> /var/log/miniupnpc.log
      return
    fi

    curl "https://infomaniak.com/nic/update?hostname=$1$hostname&password=$password&username=$username&myip=$ip"
    echo "[INFO] - $(date): Sent update request for \"$1$hostname\" with IP \"$ip\"" >> /var/log/miniupnpc.log
}

# Pings the defined URL for availability and updates a counter
# $1 - Subdomain to be checked
# $2 - Counter to be updated
# $3 - Availability to be updated
# $4 - Timeout to be used
# $5 - Action to be performed
check_server() {
    if ping -c 1 "$1"$hostname > /dev/null 2>&1; then
        echo "[SUCCESS] $(date): Ping to \"$1$hostname\" was successful." >> /var/log/miniupnpc.log
        if [ "$3" = "false" ]; then
            echo "[INFO] $(date): \"$1$hostname\" is back online." >> /var/log/miniupnpc.log
        fi
        set -- "$3" "true"
        set -- "$2" 0
    else
        set -- "$2" $(( $2 + 1 ))
        echo "[WARNING] $(date): \"$1$hostname\" couldn't be reached for $2 minutes" >> /var/log/miniupnpc.log
    fi
    if [ "$3" = "false" ]; then
        return
    elif [ "$2" = "$4" ]; then
        echo "[ALERT] $(date): \"$1$hostname\" couldn't be reached for $2 minutes. Taking action..." >> /var/log/miniupnpc.log
        $5
        set -- "$3" "false"
    fi
}

main_action() {
    echo "[ALERT] $(date): \"$subdomain_backup$hostname\" couldn't be reached for $fail_count_backup minutes." >> /var/log/miniupnpc.log
}

backup_action() {
   update_subdomain $subdomain_cloud
}

# $1 - Current minute
main_loop() {
    check_server $subdomain_backup $fail_count_backup $availability_backup $timeout_backup main_action
    if [ "$1" = "00" ]; then
        update_cloud $subdomain_main
        update_subdomain $subdomain_backup
        if [ "$availability_backup" = "false" ]; then
            main_action 
        fi 
    fi
}

# $1 - Current minute
backup_loop() {
    check_server $subdomain_main $fail_count_main $availability_main $timeout_main backup_action
    if [ "$1" == "00" ]; then
        update_subdomain $subdomain_main
        if [ "$availability_main" = "false" ]; then
            backup_action
        fi
    fi
}

# Redirects ports to the current system for 7 Days
update_ports() {
    upnpc -r 22 TCP 80 TCP 443 TCP
}

# Main loop
while true; do
    current_minute=$(date +%M)

    if [ "$current_system" = "main" ]; then
        main_loop "$current_minute"
    elif [ "$current_system" = "backup" ]; then
        backup_loop "$current_minute"
    fi

    if [ "$current_minute" = "00" ]; then
        update_ports
    fi

    sleep 60
done
