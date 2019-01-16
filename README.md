[![Build Status](https://img.shields.io/docker/build/waldronlab/bioconductor_devel.svg)](https://hub.docker.com/r/waldronlab/bioconductor_devel)


# bioconductor_devel

The `bioconductor_devel` Docker container makes some minor modifications to
Bioconductor's `bioconductor/devel_core2` container for convenient desktop/laptop usage.

1. It creates a user packages library
2. It installs some apt dependencies needed for some other Bioconductor packages