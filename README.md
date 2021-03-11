# SwissTech Code-Server

Custom Code-Server with Development Tools based on

https://hub.docker.com/r/codercom/code-server by coder.com

## Quickstart

You can spin up this image with docker with:

```sh
docker run -it --rm patrickglass/code-server
```

To make things more persistent you can mount volumes

```sh
# This will start a code-server container and expose it at http://127.0.0.1:8080.
# It will also mount your current directory into the container as `/home/coder/project`
# and forward your UID/GID so that all file system operations occur as your user outside
# the container.
#
# Your $HOME/.config is mounted at $HOME/.config within the container to ensure you can
# easily access/modify your code-server config in $HOME/.config/code-server/config.json
# outside the container.
mkdir -p ~/.config
docker run -it --name code-server -p 127.0.0.1:8080:8080 \
  -v "$HOME/.config:/home/coder/.config" \
  -v "$PWD:/home/coder/project" \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  patrickglass/code-server:latest
```

## Building the Image

To build a new updated version:

```sh
make build

make push
```
