#!/bin/bash

cd $(dirname $0)
source common.sh

docker build -t $IMAGE_URI . && docker push $IMAGE_URI
