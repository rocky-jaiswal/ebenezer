#!/bin/bash

IMAGE=rockyj/ebenezer
CONTAINER=ebenezer

sudo docker build --rm=true -t $IMAGE .
sudo docker rm $CONTAINER
sudo docker run -tid -p 3000:3000 --name $CONTAINER $IMAGE
