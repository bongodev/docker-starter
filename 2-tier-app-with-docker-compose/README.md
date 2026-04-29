# How to run app with Docker-compose

## Install docker compose version (v2)

    chmod +x docker_installer.sh

    ./docker_installer.sh

## Verify installation

    docker compose version

* You should see like: docker compose version 2.x.x

## Build and run 2 container (mysql & flask app)

    docker compose  up -d (for the first time with for single file: ie. compose.yaml)

    docker compose -f docker-compose.yml up -d (if you have to compose files, i.e. compose.yaml, docker-compose.yaml)

    docker compose up --build -d (if you make changes to the app, re-build and run)

## Stop and remove everything that was created by docker compose up, including: Containers, Networks (created by Compose), Images (optional, with a flag), Default anonymous volumes (optional, with a flag)

    docker compose down --volumes --rmi all
