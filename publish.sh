#! /bin/bash
CONTEXT=$1
FILE=$2
IMAGE_NAME_TAG=$3
REPOSITORY=$4

# build and tag
docker build -f $FILE $CONTEXT -t $IMAGE_NAME_TAG

# sync with remote tag
docker tag $IMAGE_NAME_TAG $REPOSITORY/$IMAGE_NAME_TAG

# push image to remote
docker push $REPOSITORY/$IMAGE_NAME_TAG
