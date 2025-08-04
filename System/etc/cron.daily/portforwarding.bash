#!/bin/bash

CONFIG_FILE="/etc/custom.d/portforwarding.config"
LOG_FILE="/var/log/portforwarding.log"

log() {
    type="$1"
    message="$2"
    echo '['"$type"'] - '"$(date)"': '"$message" >> "$LOG_FILE"
}

init() {
    # Create log it doesn't exist
    if [ ! -f "$LOG_FILE" ]; then
        touch "$LOG_FILE"
        log INFO 'Log file "'"$LOG_FILE"'" created.'
    fi

    # Check if configuration file exists and load it
    if [ ! -f "$CONFIG_FILE" ]; then
        log ERROR 'Configuration file "'"$CONFIG_FILE"'" not found.'
        exit 2
    else
        source "$CONFIG_FILE"
        log INFO 'Configuration file "'"$CONFIG_FILE"'" loaded.'
    fi
}

main() {
    # Check if there are ports to forward
    if [ -z "${PORTS_TO_FORWARD+x}" ] || [ ${#PORTS_TO_FORWARD[@]} -eq 0 ]; then
        log INFO 'No ports to forward specified. Exiting...'
        exit 0
    fi

    # Check if MiniUPnPc is installed
    if ! command -v upnpc 2>> "$LOG_FILE"; then
        log ERROR 'Command "upnpc" could not be found. Exiting...'
        exit 1
    fi

    # Forward ports
    if ! upnpc -r "${PORTS_TO_FORWARD[@]}" 2>> "$LOG_FILE"; then
        log ERROR 'Failed to forward ports. Exiting...'
        exit 1
    else
        log INFO 'Ports forwarded successfully. Exiting...'
        exit 0
    fi
}

init
main