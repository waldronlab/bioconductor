apt-get install -y dselect
dselect update

apt-get install -y libpng-dev libnetcdf-dev libhdf5-serial-dev  
apt-get install -y sqlite libfftw3-dev libfftw3-doc libopenbabel-dev libfftw3-3 libfftw3-dev
apt-get install -y pkg-config xfonts-100dpi xfonts-75dpi libopenmpi-dev openmpi-bin  
apt-get install -y python-mpi4py mpi-default-bin openmpi-common libexempi3 openmpi-doc  
apt-get install -y libxt-dev
apt-get install -y libjpeg62-turbo-dev libcairo2-dev  libtiff5-dev fortran77-compiler libreadline-dev  
apt-get install -y xvfb tcl8.5-dev tk8.5-dev libgsl2 libgsl0-dev libgtk2.0-dev  
apt-get install -y openjdk-8-jdk  
apt-get install -y libgl1-mesa-dev libglu1-mesa-dev htop  
apt-get install -y libgmp3-dev imagemagick libhdf5-dev libncurses-dev  
apt-get install -y libbz2-dev libxpm-dev liblapack-dev libv8-3.14-dev libperl-dev  
apt-get install -y libarchive-extract-perl libfile-copy-recursive-perl libcgi-pm-perl  
apt-get install -y tabix libdbi-perl libdbd-mysql-perl ggobi libgtkmm-2.4-dev  
apt-get install -y byacc automake graphviz  
apt-get install -y libxml-simple-perl libmpfr-dev  
apt-get install -y libudunits2-dev tree python-yaml libmodule-build-perl biber  
apt-get install -y libprotobuf-dev protobuf-compiler libapparmor-dev libgeos-dev  
apt-get install -y libprotoc-dev  librdf0-dev libmagick++-dev libsasl2-dev
apt-get install -y libpoppler-cpp-dev jags libpq-dev tk-dev libsbml5

pip install sklearn
pip install pandas

## Likely unneeded bloat?
apt-get install -y apache2  


#    texlive-fonts-recommended texlive-science texlive-bibtex-extra texlive-fonts-extra \
#    texlive-lang-european texinfo texlive-latex-extra \
#    texlive-pstricks texlive-pstricks-doc texlive-luatex \
#    postgresql-server-dev-all \
#    python-numpy python-pandas python-h5py \
