#!/bin/bash

# Details
hostname="tvreichenburg.ch"
password="" # Set password
username="" # Set username
subdomain_cloud="cloud." # Replace with cloud subdomain
subdomain_main="server1." # Replace with dedicated main subdomain
subdomain_backup="server2." # Replace with dedicated backup subdomain

# Configuration
current_system="main" # "main" or "backup"
timeout_main=5 # Minutes to wait before marking main as unavailable
timeout_backup=5 # Minutes to wait before marking backup as unavailable
state_file="/var/tmp/miniupnpc.state" # State file for mutable variables
log_file="/var/log/miniupnpc.log" # Log file

# Loads state variables from file
load_states() {
    if [ -f "$state_file" ]; then
        source "$state_file"
    else
        fail_count_main=0
        fail_count_backup=0
        availability_main="true"
        availability_backup="true"
    fi
}

# Saves state variables to file
save_states() {
    cat > "$state_file" <<EOF
fail_count_main=$fail_count_main
fail_count_backup=$fail_count_backup
availability_main=$availability_main
availability_backup=$availability_backup
EOF
}

# Updates the DNS record to point to the current IP
update_subdomain() {
    local subdomain=$1

    ip=$(external-ip)
    if [ -z "$ip" ]; then
      echo "[ERROR] - $(date): Failed to retrieve external IP." >> $log_file
      return
    fi

    curl "https://infomaniak.com/nic/update?hostname=$subdomain$hostname&password=$password&username=$username&myip=$ip"
    echo "[INFO] - $(date): Sent update request for \"$subdomain$hostname\" with IP \"$ip\"" >> $log_file
}

# Pings the defined URL for availability and updates a counter
check_server() {
    local subdomain=$1
    local counter=$2
    local availability=$3
    local timeout=$4
    local action=$5
    
    if ping -c 1 "$subdomain"$hostname > /dev/null 2>&1; then
        echo "[SUCCESS] $(date): Ping to \"$subdomain$hostname\" was successful." >> $log_file
        if [ "$availability" = "false" ]; then
            echo "[INFO] $(date): \"$subdomain$hostname\" is back online." >> $log_file
        fi
        set -- "$availability" "true"
        set -- "$counter" 0
    else
        set -- "$counter" $(( counter + 1 ))
        echo "[WARNING] $(date): \"$subdomain$hostname\" couldn't be reached for $counter minutes" >> $log_file
    fi
    if [ "$availability" = "false" ]; then
        return
    elif [ "$counter" = "$timeout" ]; then
        echo "[ALERT] $(date): \"$subdomain$hostname\" couldn't be reached for $counter minutes. Taking action..." >> $log_file
        $action
        set -- "$availability" "false"
    fi
}

main_action() {
    echo "[ALERT] $(date): \"$subdomain_backup$hostname\" couldn't be reached for $fail_count_backup minutes." >> $log_file
}

backup_action() {
   update_subdomain $subdomain_cloud
}

main_loop() {
    local minute=$1
    check_server $subdomain_backup "$fail_count_backup" "$availability_backup" $timeout_backup main_action
    if [ "$minute" = "00" ]; then
        update_cloud $subdomain_main
        update_subdomain $subdomain_backup
        if [ "$availability_backup" = "false" ]; then
            main_action 
        fi 
    fi
}

backup_loop() {
    local minute=$1
    check_server $subdomain_main "$fail_count_main" "$availability_main" $timeout_main backup_action
    if [ "$minute" = "00" ]; then
        update_subdomain $subdomain_main
        if [ "$availability_main" = "false" ]; then
            backup_action
        fi
    fi
}

# Redirects ports to the current system for 7 Days
update_ports() {
    upnpc -r 22 TCP 80 TCP 443 TCP 443 UDP
}

# Main
load_states

current_minute=$(date +%M)
if [ "$current_system" = "main" ]; then
    main_loop "$current_minute"
elif [ "$current_system" = "backup" ]; then
    backup_loop "$current_minute"
fi
if [ "$current_minute" = "00" ]; then
    update_ports
fi

save_states
