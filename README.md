# Evermind bundle

## Publish to AWS EC2 container service

### Publish individual module

Build docker image and push to AWS container repository

```sh
./publish-repo.sh <module-name> [Dockerfile-name (if other than Dockerfile)]
```

Restart running docker container

```sh
ecs-cli compose --file ./aws-compose.nightly.yml -c evermind-nightly --verbose --project-name evermind up
```

Eg: Build frontend

```sh
./publish-repo.sh evermind-frontend
ecs-cli compose --file ./aws-compose.nightly.yml -c evermind-nightly --verbose --project-name evermind up
```

Eg: build backend

```sh
./publish-repo.sh evermind-backend Dockerfile.nightly
ecs-cli compose --file ./aws-compose.nightly.yml -c evermind-nightly --verbose --project-name evermind up
```

### Build and publish all modules

```sh
./publish.nightly.sh
```
