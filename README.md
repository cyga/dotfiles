My Unix dotfiles
================

Mostly used for perl/python/ML development. Tiny UI with node+npm+brunch.

## Running via Docker

There is a Docker image available for this setup. Run it with:

```shell
$ docker run -v ~/Projects:/projects -v workstation:/root -v ~/.ssh:/keys --name workstation --rm -it bergie/shell
```

### Updating the container

```shell
$ docker volume rm workstation && docker volume create workstation
$ docker pull bergie/shell
```

### Requirements

* Terminal application (xterm, iTerm2, whatever)
* Docker
* [Powerline fonts](https://github.com/powerline/fonts)

## Installation on host

These dotfiles are easiest to deploy with [GNU Stow](https://www.gnu.org/software/stow/). Install it for the appropriate operating system:

```term
$ sudo apt-get install stow # Debian derivatives
$ sudo pacman -S stow       # Arch
$ brew install stow         # MacOS
$ apt install stow          # Termux
```

Then apply the configuration bundles you want:

```term
$ stow zsh                  # zsh and tmux configuration
$ stow git                  # git configuration
$ stow vim                  # vim configuration
```

For vim you'll also want to fetch the plugins:

```term
$ git submodule update --init
```

## Docker

[Documentation](https://docs.docker.com/docker-hub/repos/#pushing-a-repository-image-to-docker-hub)

### Build

```term
$ docker build --no-cache -t <hub-user>/<repo-name>:<tag>
$ docker build --no-cache -t cyga/dev:v0.05
```

### Push

```term
$ docker push <hub-user>/<repo-name>:<tag>
$ docker push cyga/dev:v0.05
```
