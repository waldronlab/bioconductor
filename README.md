# About the "bioconductor" script

This script makes it more convenient to run the Bioconductor docker images
locally for routine daily usage:

```bash
% ./bioconductor -h
./bioconductor -h
Usage: bioconductor.sh [-v version] [-e envtype] [-p port] [-w password] [-d dockerhome] [-l] [-h]
  -v version    Specify the Bioconductor version (e.g., 'devel', 'RELEASE_X_Y', 'X.Y').
  -e envtype    Specify the environment type ('rstudio', 'bash', or 'R'). Default is 'rstudio'.
  -p port       Specify the port number. Default is 8787.
  -w password   Specify the RStudio password. Default is 'bioc'.
  -d dockerhome Specify the Docker home directory. Default is '/Users/Levi/dockerhome'.
  -l            List all available Bioconductor Docker versions.
  -h            Show this help message.

The $DOCKER_RPKGS environment variable is optional and used to specify the R packages directory on the host machine.
If not set, the default is '$HOME/.docker-$version-packages'.
This directory is mounted into the Docker container at /usr/local/lib/R/host-site-library.
This allows R packages installed in the container to be persisted on the host machine and shared across multiple containers or sessions.
```

This script makes it easy to:
1. Run any version of Bioconductor represented by a tag at https://hub.docker.com/r/bioconductor/bioconductor_docker/tags
2. Run command-line R, bash, or RStudio
3. Have a persistent local packages directory for every version of Bioconductor, and map the container home directory to a specified local directory.
4. Specify the port and password for RStudio
5. List all available Bioconductor versions

# About the `bioconductor_docker` docker image

The `bioconductor/bioconductor_docker` image is built for both release and devel
versions of Bioconductor. It includes system dependencies so that almost every
Bioconductor package can be installed using `BiocManager::install()` with no
further troubles.  For almost everyone, this means no more errors when trying to install a package.

# Using the `bioconductor` script and docker container

1. Install a [docker client](https://www.docker.com/get-started) for
your operating system.
2. Make sure home directories are being shared (Whale icon ->
Preferences -> File Sharing). Last I checked, this was already the
case by default. You can also change the allotted system resources if
you want.
3. Copy the
[bioconductor](https://github.com/waldronlab/bioconductor/blob/devel/bioconductor)
script from this repo to somewhere in your $PATH.  Make sure
the script is executable (e.g. `chmod a+x bioconductor`).
4. From the command-line, type `bioconductor -h` to make sure it's working, then get started.
There are additional usage tips at https://github.com/Bioconductor/bioc_docker.

That's it! You can use Ctrl-C (Cmd-C on OSX) to stop the RStudio server.
