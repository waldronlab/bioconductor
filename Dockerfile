FROM bioconductor/devel_core2

RUN apt-get install libpng-dev

ADD etc/rserver.conf /etc/rstudio/

