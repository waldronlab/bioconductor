FROM bioconductor/devel_core2

RUN apt-get install libpng2

ADD etc/rserver.conf /etc/rstudio/

