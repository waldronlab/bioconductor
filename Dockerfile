FROM bioconductor/devel_core2

RUN apt-get install -y libpng-dev

ADD .Renviron /home/rstudio/
ADD .Rprofile /home/rstudio/
RUN chown rstudio:rstudio /home/rstudio/.*