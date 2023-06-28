# pia_transmission

A docker containter which uses PIA wireguard for connections, the PIA daemon is written in go.

Contains a modified wg-quick bash script that works in Docker containers, changes from original include removing sysctl commands and resolvconf commands used for DNS configuration which are incompatible due to limitations in the Docker environment.

Feel free to contribute, fork, suggest new features.

All rights reserved to the original authors of wg-quick and any other code I have used which is not explicitly mentioned here.