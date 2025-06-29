# Flawfinder Docker Image

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A lightweight, secure Docker image for running [Flawfinder](https://dwheeler.com/flawfinder/), a static analysis tool that scans C/C++ source code for potential security flaws.

This image is:
- **Lightweight**: Based on the `python:3.13-alpine` image.
- **Secure**: Runs as a non-root user (`appuser`) by default.
- **Specific**: Bundles `flawfinder` version `2.0.19`.

## Usage

### 1. Build the Image

To build the Docker image from the `Dockerfile`, navigate to the repository root and run:

```sh
docker build -t flawfinder:2.0.19 .
```

### 2. Run the Container

To use the image, you need to mount your C/C++ source code as a volume into the container. The container will then run `flawfinder` on the mounted code.

For example, to analyze the source code in your current directory:

```sh
# On Linux/macOS
docker run --rm -it -v "$(pwd):/src" flawfinder:2.0.19 flawfinder /src

# On Windows (Command Prompt)
docker run --rm -it -v "%cd%:/src" flawfinder:2.0.19 flawfinder /src

# On Windows (PowerShell)
docker run --rm -it -v "${PWD}:/src" flawfinder:2.0.19 flawfinder /src
```

This command does the following:
- `docker run --rm -it`: Runs the container interactively and removes it once it exits.
- `-v "$(pwd):/src"`: Mounts the current host directory into the `/src` directory inside the container.
- `flawfinder:2.0.19`: Specifies the image to use.
- `flawfinder /src`: This is the command executed inside the container. It runs `flawfinder` against the source code located in `/src`.

You can pass any valid `flawfinder` arguments to the command. For example, to generate an HTML report:

```sh
docker run --rm -it -v "$(pwd):/src" flawfinder:2.0.19 flawfinder --html /src > report.html
```

## Dockerfile Details

- **Base Image**: `python:3.13-alpine`
- **Flawfinder Version**: `2.0.19`
- **User**: The container process runs as the non-root user `appuser` (UID/GID `666`) for enhanced security.
- **PATH**: The `PATH` environment variable is updated to include the location of the `flawfinder` executable, so it can be called directly.

## License

This project is licensed under the MIT License, as specified by the `LABEL` in the `Dockerfile`.