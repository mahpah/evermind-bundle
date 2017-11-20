#! /bin/bash

TAG=nightly
REPO=215519188259.dkr.ecr.ap-southeast-1.amazonaws.com
COMPOSE_FILE="./aws-compose.nightly.yml"

declare -A MODULES
MODULES[evermind-backend]=Dockerfile
MODULES[evermind-storage]=Dockerfile
MODULES[evermind-preview]=Dockerfile
MODULES[evermind-media]=Dockerfile
MODULES[evermind-frontend]=Dockerfile

for key in ${!MODULES[@]}; do
    # echo ${key} ${MODULES[${key}]}
    ./publish-repo.sh ${key} ${MODULES[${key}]}
done

aws ecr get-login --no-include-email --region ap-southeast-1 | /bin/bash

./publish.sh evermind-backend evermind-backend/Dockerfile.nightly digimed/evermind-backend:$TAG $REPO
./publish.sh evermind-generate-document-preview evermind-generate-document-preview/Dockerfile digimed/evermind-preview:$TAG $REPO
./publish.sh evermind-storage evermind-storage/Dockerfile digimed/evermind-storage:$TAG $REPO
./publish.sh evermind-media evermind-media/Dockerfile digimed/evermind-media:$TAG $REPO
./publish.sh evermind-frontend evermind-frontend/Dockerfile digimed/evermind-frontend:$TAG $REPO

ecs-cli compose --file $COMPOSE_FILE -c evermind-nightly --verbose --project-name evermind up
