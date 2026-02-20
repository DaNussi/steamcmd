# SteamCMD Docker Image

A Docker image for running SteamCMD on Arch Linux with all necessary dependencies.

## Overview

This Docker image provides a ready-to-use SteamCMD environment based on Arch Linux. It includes all required 32-bit libraries and dependencies needed to run SteamCMD and Steam-based game servers.

## Features

- Based on `archlinux/archlinux:latest`
- Multilib repository enabled for 32-bit compatibility
- Includes essential dependencies:
  - `lib32-sdl2-compat`
  - `lib32-dbus`
  - `lib32-gcc-libs`
  - `glibc`
- Non-root user setup (`ark` user with UID/GID 1000)
- SteamCMD pre-installed and initialized

## Building the Image

```bash
docker build -t ghcr.io/danussi/steamcmd .
```

## Pulling the Image

```bash
docker pull ghcr.io/danussi/steamcmd
```

## Running the Container

### Interactive Mode

Run SteamCMD interactively:

```bash
docker run -it ghcr.io/danussi/steamcmd
```
or
```bash
docker run -it ghcr.io/danussi/steamcmd steamcmd
```

### Run Specific Commands

Execute SteamCMD commands directly:

```bash
docker run -it ghcr.io/danussi/steamcmd steamcmd +login anonymous +app_update 376030 validate +quit
```

### Run Interactive Bash Shell

Open bash shell inside the container:

```bash
docker run -it ghcr.io/danussi/steamcmd bash
```

## Common Use Cases

### Download a Game Server

```bash
docker run -it -v ./gameserver:/gameserver ghcr.io/danussi/steamcmd \
  +force_install_dir /gameserver \
  +login anonymous \
  +app_update <APP_ID> validate \
  +quit
```

Replace `<APP_ID>` with the Steam App ID of your desired game server.


## User Information

- **Username**: `ark`
- **UID/GID**: `1000:1000`
- **Home Directory**: `/home/ark`
- **Sudo Access**: Passwordless sudo enabled

## Dependencies

The image includes the following packages:
- `git`
- `base-devel`
- `lib32-sdl2-compat`
- `lib32-dbus`
- `lib32-gcc-libs`
- `glibc`

## Notes

- This image was built for specifically ARK Dedicated Server, but it can be used for any SteamCMD-based game server.
- SteamCMD is installed from the AUR (Arch User Repository)
- The initial SteamCMD update is performed during the build process
- Cache files are cleaned up after installation to reduce image size

## License

This Dockerfile is provided as-is for building a SteamCMD container environment.


