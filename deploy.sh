docker context create ecs developersnet-edfi-shared
docker context use developersnet-edfi-shared
docker compose -f ./docker-compose.aws.yml up
docker context use default

