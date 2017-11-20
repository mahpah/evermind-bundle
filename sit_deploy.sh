#! /bin/bash

REPO="215519188259.dkr.ecr.ap-southeast-1.amazonaws.com/digimed"

MODULES=(
    "evermind-storage"
    "evermind-preview"
    "evermind-media"
)

for service in ${MODULES[@]}; do
    echo "$REPO/$service:sit"
    docker pull "$REPO/$service:sit"
done

docker-compose -f docker-compose.sit.yml up

# docker run -d \
#     -p 9000:80 \
#     -v /var/www/evermind-sit/storage:/var/evermind-sit/storage \
#     -e ConnectionStrings__DefaultConnection="User ID=digimed;Password=DigiMed123;Host=dgm-staging.c8h9mndpwrjg.ap-southeast-1.rds.amazonaws.com;Port=5432;Database=evermind-storage-sit;Pooling=true;" \
#     -e Storage__RootPath="/var/evermind-sit/storage" \
#     -e WebHostUrl="https://sit.evermind.vn/storage/" \
#     215519188259.dkr.ecr.ap-southeast-1.amazonaws.com/digimed/evermind-storage:nightly

# docker run -d \
#     -p 8000:80 \
#     -v /var/www/evermind-sit/preview:/var/evermind-sit/preview \
#     -e ConnectionStrings__DefaultConnection="User ID=digimed;Password=DigiMed123;Host=dgm-staging.c8h9mndpwrjg.ap-southeast-1.rds.amazonaws.com;Port=5432;Database=evermind-preview-sit;Pooling=true;" \
#     -e Storage__RootPath="/var/evermind-sit/preview" \
#     -e WebHostUrl="https://sit.evermind.vn/preview/" \
#     -e MediaServer__ServerUrl="https://sit.evermind.vn/media/" \
#     215519188259.dkr.ecr.ap-southeast-1.amazonaws.com/digimed/evermind-preview:nightly

# docker run -d \
#     -p 7777:7777 \
#     -v /var/www/evermind-sit/media:/var/evermind-sit/media \
#     -e NODE_ENV=sit \
#     -e MEDIA_ROOT_URI="//sit.evermind.vn/media/" \
#     -e mediaStorage="/var/evermind-sit/media" \
#     215519188259.dkr.ecr.ap-southeast-1.amazonaws.com/digimed/evermind-media:nightly
