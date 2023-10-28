#!/bin/bash


if [ ! -d go_pia ]
    then
        echo "Folder doesn't exist, cloning."
        git clone https://github.com/pood0g/go_pia
        cd go_pia
    else
        echo "Folder exists, updating."
        cd go_pia
        git pull
        git reset main --hard
fi

if [ -d go_pia ]
    then
        CGO_ENABLED=0 go build
        cd ..
    else
        echo "Something is wrong."
        exit 1
fi

if [ -f go_pia/go_pia ]
    then
        docker build . -t go_pia
    else
        echo "go_pia binary not found"
fi
