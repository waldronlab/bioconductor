[![Build Status](https://img.shields.io/docker/build/waldronlab/bioconductor_devel.svg)](https://hub.docker.com/r/waldronlab/bioconductor_devel)

# About waldronlab/bioconductor_devel

The `bioconductor_devel` Docker container makes some minor
modifications to Bioconductor's `bioconductor/devel_core2` container
for convenient desktop/laptop usage:

1. It creates a user packages library in the host directory
`~/.docker-devel-packages`. Any new packages you install will go here,
and will remain after restarting your container.
2. It creates a host directory `~/dockerhome` where the home directory
of the Docker user will be mounted. Files can be shared between the
Docker container and host filesystem here.
3. It installs dependencies needed for some Bioconductor packages
(currently just `libpng-dev`)

# Usage

1. Install a [docker client](https://www.docker.com/get-started) for
your operating system. 
2. Make sure home directories are being shared (Whale icon ->
Preferences -> File Sharing). Last I checked, this was already the
case by default. You can also change the allotted system resources if
you want.
3. Copy the
[bioconductor](https://github.com/waldronlab/bioconductor_devel/blob/master/Dockerfile)
script from this repo to somewhere in your $PATH. Modify as you see
fit, e.g. if you want to mount different directories or in a different
place than `~/dockerhome`, or change the rstudio password.  Make sure
the script is executable (e.g. `chmod a+x bioconductor`).
4. From the command-line, type `bioconductor devel` or `bioconductor
release`. Later you can use Ctrl-C or Command-C(mac) to stop the
container. There are additional usage tips at
https://github.com/Bioconductor/bioc_docker, including how to access the image from a command-line. 
These images are called
"waldronlab/bioconductor_devel" and "waldronlab/bioconductor_release".
5. In a browser, open http://localhost:8787. Login with username is
"rstudio" and password "rstudiopassword" unless you change the
password in the "bioconductor" script of step 3.

That's it! You can stop the instance you're running and switch to
release or devel (but you can't currently run both at the same
time). There will be separate host package libraries for
user-installed packages (in `~/.docker-devel-packages` and
`~/.docker-release-packages`), and a common home directory in
`~/dockerhome`. `docker pull` is run each time you invoke the
`bioconductor` script, so you should automatically get the most
up-to-date Bioconductor release or devel versions, and will only have
to run `BiocManager::install()` to update user-installed packages.
