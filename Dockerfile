FROM bioconductor/bioconductor_full:devel

RUN apt-get install -y htop tree tmux vim

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

