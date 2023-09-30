# pia_transmission

A docker containter which uses PIA wireguard for connections, the PIA daemon is written in go.

Contains a modified wg-quick bash script that works in Docker containers, changes from original include removing sysctl commands and resolvconf commands used for DNS configuration which are incompatible due to limitations in the Docker environment.

Feel free to contribute, fork, suggest new features.

All rights reserved to the original authors of wg-quick and any other code I have used which is not explicitly mentioned here.

## Running

Example for building and running the container.

```sh
git clone https://github.com/pood0g/go_pia
git clone https://github.com/pood0g/go_pia_wg_transmission
cd go_pia
CGO_ENABLED=0 go build --ldflags "-w -s"
cd ../go_pia_wg_transmission
cp ../go_pia/go_pia .
docker build . -t go_pia
docker run --name go_pia --cap-add NET_ADMIN -p 9091:9091 -v $HOME/Downloads:/downloads -it go_pia
docker start go_pia
```
