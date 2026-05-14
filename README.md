# `bioc-run`

## Introduction

`bioc-run` is a script that makes it more convenient to run Bioconductor
Docker images locally. It is intended for routine daily usage.

This script makes it easy to:

1. Run any version of Bioconductor represented by a tag at
  <https://hub.docker.com/r/bioconductor/bioconductor_docker/tags>
2. Run command-line `R`, `bash`, or `RStudio`
3. Have a persistent local packages directory for every version of
  Bioconductor, and map a local directory to the home directory on the
  container (i.e., a volume mounts).
4. Specify the port and password for `RStudio`
5. List all available Bioconductor versions
6. Pass additional arguments to `R` or `bash` (e.g., `R CMD build`)
7. Automatically mount the current working directory to `/workspace` in `R` and
  `bash` modes.

## Pre-requisites

1. An installation of the
  [Docker Engine](https://docs.docker.com/engine/install/) or
  [Docker Desktop](https://www.docker.com/products/docker-desktop/) is required.
2. For the volume mounts, `File Sharing` must be enabled in the Docker
  settings.
3. Tested on Mac and Linux operating systems. Windows users may have success
  with the Windows Subsystem for Linux (WSL).

## Installation

The script can be cloned via the command line (e.g., via SSH):

```bash
git clone git@github.com:Bioconductor/bioc-run
```

## Usage

Run the script directly from the folder (e.g., `./bioc-run`) or see the
[advanced setup section](#optional-advanced-setup).

From the command-line, type `bioc-run -h` to make sure it's working:

```bash
% ./bioc-run -h
Usage: bioc-run [-v version] [-e envtype] [-p port] [-w password] [-d dockerhome] [-s provider] [-l] [-h] [-r] [-q] [-- args...]
  -v version    Specify the Bioconductor version (e.g., 'devel', 'RELEASE_X_Y', 'X.Y').
  -e envtype    Specify the environment type ('rstudio', 'bash', or 'R'). Default is 'rstudio'.
  -p port       Specify the port number. Default is 8787.
  -w password   Specify the RStudio password. Default is 'bioc'.
  -d dockerhome Specify the Docker home directory. Default is '$HOME/dockerhome'.
  -s provider   Specify the container registry provider ('docker' or 'ghcr.io'). Default is 'docker'.
  -l            List all available Bioconductor Docker versions.
  -h            Show this help message.
  -q            Quiet mode. Suppress informational messages.
  -r            Reset the ownership of '$DOCKER_HOME' and '$DOCKER_RPKGS' to '$USERID:$GROUPID'.
                This option ensures that files in volumes are owned by the same user and group
                on the host system.

Additional arguments after the options will be passed to the environment:
  - For 'R' mode: passed as arguments to R (e.g., 'CMD build .' or '--version')
  - For 'bash' mode: passed as arguments to bash (e.g., '-c "command"')
  - For 'rstudio' mode: extra arguments are ignored with a warning

For 'R' and 'bash' modes, the current working directory is mounted at /workspace
inside the container, allowing you to access local files directly.

IMPORTANT: Use '--' to stop option parsing if you need to pass arguments that conflict
with bioc-run's own options (e.g., -e, -v, -p, -w, -d, -s, -r, -h, -l).

Examples:
  bioc-run -v devel -e R CMD build .
  bioc-run -v devel -e R CMD build myPackage/
  bioc-run -v devel -e R --version
  bioc-run -v devel -e R -- -e "print('hello')"         # Use -- to pass -e to R
  bioc-run -v devel -e bash -c 'R CMD build .'
  bioc-run -v devel -e bash -- -c 'echo test'           # Use -- to pass -c to bash

The $DOCKER_RPKGS environment variable is optional and used to specify the R packages directory on the host machine.
If not set, the default is '$HOME/.docker-$version-packages'.
This directory is mounted into the Docker container at /usr/local/lib/R/host-site-library.
This allows R packages installed in the container to be persisted on the host machine and shared across multiple containers or sessions.
```

Use <kbd>Ctrl</kbd> + <kbd>C</kbd> (<kbd>⌘ Command</kbd> + <kbd>C</kbd> on OSX)
to stop the `RStudio` server.

## Docker Containers for Bioconductor

For more information about Docker containers for Bioconductor, see
<https://bioconductor.org/help/docker/>.

## (Optional) Advanced Setup

If you want to use the `bioc-run` script without being in the folder,
do either of the following:

1. Create a Symbolic Link
    * On macOS or Linux, create a "shortcut" in `~/bin/` with
      `ln -s /path/to/bioc-run ~/bin/bioc-run`

**Note**. Ensure that `/home/user/bin/` is in the `$PATH`

2. Add it to the `$PATH`
    * If the `bioc-run` script is in a folder that is already in the
      `$PATH`, it can be run from any location in the terminal.
    * If comfortable editing the shell's configuration file (like
      `~/.bashrc` or `~/.zshrc`), add a new folder to the `$PATH`.
      Add `export PATH="$PATH:/path/to/folder"` to the end of the shell
      configuration file. Replace `/path/to/folder` with the actual folder
      that the script is in.

**Note**. Make sure the script is executable (e.g. `chmod a+x bioc-run`).

