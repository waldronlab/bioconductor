FROM bioconductor/devel_base2

RUN apt-get install -y libpng-dev libnetcdf-dev libhdf5-serial-dev \
    sqlite libfftw3-dev libfftw3-doc libopenbabel-dev fftw3 fftw3-dev \
    pkg-config xfonts-100dpi xfonts-75dpi libopenmpi-dev openmpi-bin \
    mpi-default-bin openmpi-common libexempi3 openmpi-doc \
    texlive-science python-mpi4py texlive-bibtex-extra \
    texlive-fonts-extra fortran77-compiler gfortran libreadline-dev \
    libx11-dev libxt-dev texinfo apache2 libxml2-dev \
    libjpeg62-turbo-dev libcairo2-dev  libtiff5-dev \
    xvfb tcl8.5-dev tk8.5-dev libicu-dev libgsl2 libgsl0-dev libgtk2.0-dev \
    openjdk-8-jdk texlive-latex-extra \
    texlive-fonts-recommended libgl1-mesa-dev libglu1-mesa-dev htop \
    libgmp3-dev imagemagick unzip libhdf5-dev libncurses-dev \
    libbz2-dev libxpm-dev liblapack-dev libv8-3.14-dev libperl-dev \
    libarchive-extract-perl libfile-copy-recursive-perl libcgi-pm-perl \
    tabix libdbi-perl libdbd-mysql-perl ggobi libgtkmm-2.4-dev \
    libssl-dev byacc automake \
    postgresql-server-dev-all graphviz python-pip \
    libxml-simple-perl texlive-lang-european libmpfr-dev \
    libudunits2-dev tree python-yaml libmodule-build-perl gdb biber \
    python-numpy python-pandas python-h5py libprotoc-dev \
    libprotobuf-dev protobuf-compiler libapparmor-dev libgeos-dev \
    librdf0-dev libmagick++-dev libsasl2-dev \
    texlive-pstricks texlive-pstricks-doc texlive-luatex
