# pia_transmission

A docker containter which uses PIA wireguard for connections, the PIA daemon is written in go.

Contains a modified wg-quick bash script that works in Docker containers, changes from original include removing sysctl commands and resolvconf commands used for DNS configuration which are incompatible due to limitations in the Docker environment.

Feel free to contribute, fork, suggest new features.

All rights reserved to the original authors of wg-quick and any other code I have used which is not explicitly mentioned here.

## Running

Example for building and running the container.

```sh
# Building
git clone https://github.com/pood0g/go_pia_docker
cd go_pia_docker
./build.sh

# Running
docker run --name go_pia --cap-add NET_ADMIN -p 9091:9091 -v $HOME/Downloads:/downloads --restart=always -it go_pia
```
