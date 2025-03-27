# Docker environment for symoro

## Pre-requisites

### For Linux
- Install [Docker Engine](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository);
- Do the [post-installation steps](https://docs.docker.com/engine/install/linux-postinstall/);

### For WSL2
- Install [WSL2](https://learn.microsoft.com/fr-fr/windows/wsl/install);
- Install [Docker Desktop](https://docs.docker.com/desktop/install/windows-install/);
- Install [Terminal](https://learn.microsoft.com/fr-fr/windows/terminal/install).

Then, install the Docker image and create a container.

## Docker Hub

The image is available on the Docker Hub : see [baaluidnrey/symoro](https://hub.docker.com/repository/docker/baaluidnrey/symoro/general).

## Build from sources

```bash
# 1. clone symoro
git clone -b docker https://github.com/baaluidnrey/symoro

# 2. install the image
cd symoro/docker
./install_docker.sh

# 3. launch symoro
./start_symoro.sh
```

The volume `symoro-robots` is mounted in the docker container to the location of the saved files.