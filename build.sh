#!/bin/bash

#set -euo pipefail

cd $(dirname $0)
source common.sh

cd artifacts
function cpartifact {
	[ ! -d "$1" ] && rsync -av $HOME/.julia/artifacts/$1 $1
}

cpartifact d044e8d51eb58575dbce05d6ad981cdf5d18ded6
cpartifact 6b1a60793e5e98abdcfc3724cfa22b2a5348dc09
cpartifact 20bd3307e0252b00c171e1753f6424bbbdc5678f
cpartifact ac25f8a4fc72584e696bd007b229fd2921b34062
cpartifact 48c41dccb8db0c9aa9483267cb33719207abe4c1
cpartifact c1f953962cc13e4a55f7b2333fb212e7f5c08817

cd ..

docker build -t $IMAGE_URI .

docker push $IMAGE_URI
