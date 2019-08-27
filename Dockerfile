FROM bioconductor/bioconductor_full:devel

# Add extra dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    htop \
    tree \
    tmux \
    vim

RUN R -e "BiocManager::install('stringi')"

ARG USER_ID
ARG GROUP_ID

RUN if [ ${USER_ID:-0} -ne 0 ] && [ ${GROUP_ID:-0} -ne 0 ]; then \
    userdel -f rstudio && \
    if getent group rstudio ; then groupdel rstudio; fi && \
    groupadd -g ${GROUP_ID} rstudio && \
    useradd -l -u ${USER_ID} -g rstudio rstudio && \
    install -d -m 0755 -o rstudio -g rstudio /home/rstudio && \
    chown --changes --silent --no-dereference --recursive \
        --from=1000:1000 ${USER_ID}:${GROUP_ID} \
        /home/rstudio \
;fi

USER rstudio

