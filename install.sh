apt-get update
apt-get -y upgrade
apt-get clean
apt-get autoremove

apt-get install -y libpng-dev libnetcdf-dev libhdf5-serial-dev \
    sqlite libfftw3-dev libfftw3-doc libopenbabel-dev libfftw3-3 libfftw3-dev\
    pkg-config xfonts-100dpi xfonts-75dpi libopenmpi-dev openmpi-bin \
    python-mpi4py mpi-default-bin openmpi-common libexempi3 openmpi-doc \
    texlive-fonts-recommended texlive-science texlive-bibtex-extra texlive-fonts-extra \
    texlive-lang-european texinfo texlive-latex-extra \
    texlive-pstricks texlive-pstricks-doc texlive-luatex \
#    postgresql-server-dev-all \
#    python-numpy python-pandas python-h5py \
    libx11-dev libxt-dev apache2 \
    libjpeg62-turbo-dev libcairo2-dev  libtiff5-dev fortran77-compiler libreadline-dev \
    xvfb tcl8.5-dev tk8.5-dev libgsl2 libgsl0-dev libgtk2.0-dev \
    openjdk-8-jdk \
    libgl1-mesa-dev libglu1-mesa-dev htop \
    libgmp3-dev imagemagick libhdf5-dev libncurses-dev \
    libbz2-dev libxpm-dev liblapack-dev libv8-3.14-dev libperl-dev \
    libarchive-extract-perl libfile-copy-recursive-perl libcgi-pm-perl \
    tabix libdbi-perl libdbd-mysql-perl ggobi libgtkmm-2.4-dev \
    byacc automake graphviz \
    libxml-simple-perl libmpfr-dev \
    libudunits2-dev tree python-yaml libmodule-build-perl biber \
    libprotobuf-dev protobuf-compiler libapparmor-dev libgeos-dev \
    libprotoc-dev  librdf0-dev libmagick++-dev libsasl2-dev
