FROM bioconductor/bioconductor_full:release

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    htop \
    locate \
    tree \
    tmux \
    vim

USER bioc

RUN R -e "BiocManager::install('tinytex'); tinytex::install_tinytex()"

