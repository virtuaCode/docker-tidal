# Docker-Compose setup for TidalCycles

## Requirements

- docker
- docker-compose

## Usage

Make sure that the jackd server is already started on the host system, otherwise SuperCollider won't be able to establish a connection with jackd.

Start the docker container with:


    docker-compose up


Additionally the container provides a live-coding web-app ([extramuros](https://github.com/thgrund/extramuros/tree/osc)) which is available at http://localhost:8000

## Configuration

    # docker-compose.yml

    ...
    environment: 
      ENABLE_EXTRAMUROS: 0    # Enable/Disable extramuros
    ...
