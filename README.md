| Hub |    Version     | Status |
| --- | --------------- |--------------- |
| Docker | [![](https://images.microbadger.com/badges/version/waldronlab/bioconductor:devel.svg)](https://microbadger.com/images/waldronlab/bioconductor:devel)| [![](https://images.microbadger.com/badges/image/waldronlab/bioconductor:devel.svg)](https://microbadger.com/images/waldronlab/bioconductor:devel) |
| Docker | [![](https://images.microbadger.com/badges/version/waldronlab/bioconductor:release.svg)](https://microbadger.com/images/waldronlab/bioconductor:release)| [![](https://images.microbadger.com/badges/image/waldronlab/bioconductor:release.svg)](https://microbadger.com/images/waldronlab/bioconductor:release) |
| Docker | [![](https://images.microbadger.com/badges/version/waldronlab/bioconductor:RELEASE_3_10.svg)](https://microbadger.com/images/waldronlab/bioconductor:RELEASE_3_10)|[![](https://images.microbadger.com/badges/image/waldronlab/bioconductor:RELEASE_3_10.svg)](https://microbadger.com/images/waldronlab/bioconductor:RELEASE_3_10) |

# About the "bioconductor" script

This script makes it more convenient to run the Bioconductor docker images
locally for routine daily usage:

1. It creates a host directory `~/dockerhome` where the home directory
of the Docker user will be mounted. Files can be shared between the
Docker container and host filesystem here.
2. It results in user-installed packages being added to the host directory
`~/.docker-devel-packages` or `~/.docker-release-packages`.
3. It runs the Docker container
[bioconductor/bioconductor_docker](https://github.com/bioconductor/bioconductor_docker)

## Inputs to the 'biconductor' script

The user must specify the version of Bioconductor to spin up as a Docker image.
The available inputs for the **first** argument are:

    1. release
    2. devel

The **second** argument for the 'bioconductor' script denotes the environment type
to run when executing the script this will either put the user in one of two
supported environements:

    1. rstudio - allows the user to open up an rstudio session in the browser
    2. shell - put the user in the command line within the container

Note. The default user environment is the `rstudio` session

# About the `bioconductor_docker` docker image

The `bioconductor/bioconductor_docker` image is built for both release and devel
versions of Bioconductor. It includes system dependencies so that almost every
Bioconductor package can be installed using `BiocManager::install()` with no
further troubles.  For almost everyone, this means no more errors when trying to install a package.

# For singularity users

To make a generalization, Docker is more supported by commercial Cloud
providers, whereas [Singularity](https://www.sylabs.io/singularity/) is (far)
more likely to be supported by university high-performance computing
facilities.

If you have singularity installed, pull and the singularity images as follows (or substitute "devel" with "release" for the release version):

```
singularity build $HOME/bioconductor-devel.img docker://waldronlab/bioconductor:devel
```

So far I have only used singularity for bash and R, with aliases like these:

```
alias singulaR="singularity shell $HOME/bioconductor-devel.simg R"
alias singularbash="singularity shell $HOME/bioconductor-devel.simg bash"
```

Note that default behavior in singularity is to mount your home (and several
other) directories as the home directory within the container, while
maintaining your user permissions. This makes all the docker efforts to mount
volumes for your container package and home directories unnecessary. I haven't
yet tried running rstudio via singularity, but it should be possible?

# Using the `bioconductor` script and docker container

1. Install a [docker client](https://www.docker.com/get-started) for
your operating system.
2. Make sure home directories are being shared (Whale icon ->
Preferences -> File Sharing). Last I checked, this was already the
case by default. You can also change the allotted system resources if
you want.
3. Copy the
[bioconductor](https://github.com/waldronlab/bioconductor/blob/master/bioconductor)
script from this repo to somewhere in your $PATH. Modify as you see
fit, e.g. if you want to mount different directories or in a different
place than `~/dockerhome`, or change the rstudio password.  Make sure
the script is executable (e.g. `chmod a+x bioconductor`).
4. From the command-line, type `bioconductor devel` or `bioconductor
release`. Later you can use Ctrl-C to stop the
container. There are additional usage tips at
https://github.com/Bioconductor/bioc_docker.
5. If using the 'rstudio' argument (default) --- In a browser, open
http://localhost:8787. Login with username is "rstudio" and password
"rstudiopassword" unless you change the password within the "bioconductor"
script in step 3.

That's it! You can stop the instance you're running and switch to
release or devel (but you can't currently run both at the same
time). There will be separate host package libraries for
user-installed packages (in `~/.docker-devel-packages` and
`~/.docker-release-packages`), and a common home directory in
`~/dockerhome`. `docker pull` is run each time you invoke the
`bioconductor` script, so you should automatically get the most
up-to-date Bioconductor release or devel versions, and will only have
to run `BiocManager::install()` to update user-installed packages.

**Note**: Checking mechanisms have been implemented for the script to error if
anything other than "release" or "devel" is entered in the first argument.

# Example command line execution

The following commands may be useful in your `~/.bash_profile` for
command-line R and bash usage with the same containers, package directories,
home directory, and rstudio user:

```bash
alias releaseshell="bioconductor release shell"
alias develshell="bioconductor devel shell"

# coming soon #
alias Rrelease="bioconductor release R"
alias Rdevel="bioconductor devel R"
```

# TODO

The `bioconductor` script is rudimentary and should use docopt, and provide
start & stop. It could also provide arguments for the volume location etc.


