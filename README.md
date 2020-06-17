# Easy to use dev environment with Docker

Inspired by [this post](https://bergie.iki.fi/blog/docker-developer-shell/).

Mostly used for perl/python/ML development.

# HOWTO

## Usage

There is a Docker image available for this setup at docker hub:

```bash
docker run -v ~/project-dir:/projects/project-dir -v ~/.ssh:/keys --name <NAME> --rm -it cyga/ubuntu20.04-dev
```

Other docker hub repositiories can be used as well.

## Requirements

To use the container above you need to have tmux installed. It's easy to do under linux, for windows you can use WSL2 + Docker in Windows.

## Create

In order to create another container:

```
docker build -t <HUB_USER>/<CONTAINER_NAME> .
# for example:
# docker build -t cyga/ubuntu20.04-dev .
```

You can re-start failed process (missing package or smth else).

## Push to docker hub


```
docker push <HUB_USER>/<CONTAINER_NAME>
# for example:
# docker push cyga/ubuntu20.04-dev
```

or with version:

```
docker push <HUB_USER>/<CONTAINER_NAME>:<TAG>
# for example:
# docker push cyga/ubuntu20.04-dev:v0.01
```

## Builds

Check your dev dockers at [docker site](https://cloud.docker.com/repository/docker/cyga/dev)
