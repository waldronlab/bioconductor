FROM bioconductor/devel_core2

RUN apt-get install -y libpng-dev
RUN echo r-libs-user=/usr/local/lib/R/host-site-library >> /etc/rstudio/rserver.conf

