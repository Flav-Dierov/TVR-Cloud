#!/bin/bash
# Uses MiniUPnPc to forward ports for 7d

upnpc -r 22 TCP 80 TCP 443 TCP 443 UDP
