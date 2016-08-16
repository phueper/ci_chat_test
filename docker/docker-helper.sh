#!/usr/bin/env bash
if [ "$1" != "" ]; then
    eval "$(docker-machine env $1)"
fi
if [ "${DOCKER_MACHINE_NAME}" != "" ]; then
    echo "your Docker-Machine IP: $(docker-machine ip ${DOCKER_MACHINE_NAME})"
else
    echo "No docker machine name has been found! If you use docker-machine, please pass it to docker-helper.sh or init the ENV yourself"
fi

function docker-ip {
    docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -q)
}

function dbash {
    container=$1
    [ -z "$container" ] && container=web
    docker-compose exec $container /bin/bash
}

function db-init {
    docker-compose run --rm web mysql -u chat-app-test -pchat-app-test -h db chat-app-test < db_init.sql
}

