#! /bin/bash
CONTEXT=$1
FILE=$2
IMAGE_NAME_TAG=$3
REPOSITORY=$4

# build and tag
docker build -f $FILE $CONTEXT -t $REPOSITORY/$IMAGE_NAME_TAG

# push image to remote
docker push $REPOSITORY/$IMAGE_NAME_TAG
