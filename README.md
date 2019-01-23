# About this "bioconductor" script

This script makes it more convenient to run the Bioconductor docker images locally for routine daily usage:

1. It creates a host directory `~/dockerhome` where the home directory
of the Docker user will be mounted. Files can be shared between the
Docker container and host filesystem here.
2. It results in user-installed packages being added to the host directory `~/.docker-devel-packages` or `~/.docker-devel-packages`. 
3. It ships with Docker containers [waldronlab/bioconductor_devel](https://github.com/waldronlab/bioconductor_devel) and [waldronlab/bioconductor_release](https://github.com/waldronlab/bioconductor_devel), which install additional system dependencies on top of bioconductor/release_base2 and bioconductor/devel_base2 that are needed to install some Bioconductor packages. The script can, however, easily be changed to use any of the [official Bioconductor Docker containers](https://bioconductor.org/help/docker/).

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

# TODO

The `bioconductor` script is rudimentary and should use docopt,
provide start & stop, and have an option for opening a bash shell or R
console. It could also provide arguments for the volume location etc. 

 It at least does error at the `docker pull` stage if you enter
anything other than "release" or "devel" as the argument.
