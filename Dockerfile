FROM bioconductor/bioconductor_full:release

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    htop \
    locate \
    tree \
    tmux \
    vim

RUN R -e "BiocManager::install('tinytex'); tinytex::install_tinytex()"

RUN chmod -R a+w /usr/local/lib/R/site-library/ /usr/local/lib/R/library/
