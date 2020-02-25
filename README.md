# Docker-Compose setup for TidalCycles

## Requirements

- docker
- docker-compose

## Usage

Make sure that the jackd server is already started on the host system, otherwise SuperCollider won't be able to establish a connection with jackd.

Start the docker container with:

```
docker-compose up
```

## Configuration

SuperCollider startup file:
    - `./configs/SuperCollider/startup.scd`
