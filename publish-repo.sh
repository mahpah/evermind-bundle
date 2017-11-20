TAG=nightly
REPO=215519188259.dkr.ecr.ap-southeast-1.amazonaws.com
COMPOSE_FILE="./aws-compose.nightly.yml"
MODULE=$1
DOCKER_FILE=${2:-Dockerfile}
TAG=nightly
NAMESPACE=digimed
IMAGE_NAME_TAG="$NAMESPACE/$MODULE:$TAG"

if [ ! -d ./"$MODULE" ]; then
    echo "$MODULE is not exist or unaccessible"
    exit 1
fi

if [ ! -f "./$MODULE/$DOCKER_FILE" ]; then
    echo "./$MODULE/$DOCKER_FILE is not exist or unaccessible"
    exit 1
fi

echo $DOCKER_FILE
echo "Preparing to publish \"$MODULE\""
echo "to remote repository \"$REPO\""
echo "using Dockerfile \"$DOCKER_FILE\""

echo "Login to AWS container service"
# aws ecr get-login --no-include-email --region ap-southeast-1 | /bin/bash

echo "Building $REPO/$IMAGE_NAME_TAG"
./publish.sh $MODULE $MODULE/$DOCKER_FILE $IMAGE_NAME_TAG $REPO
