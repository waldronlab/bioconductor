FROM bioconductor/bioconductor_docker:latest

# Note: texinfo seems still required if tinytex is used instead (below), 
# but texlive and texlive-fonts-extra are not.

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    texinfo \
    texlive \
    texlive-fonts-extra \
    htop \
    locate \
    tree \
    tmux \
    vim

# If you want to save space and don't mind playing whack-a-mole with `tlmgr install` 
# when building/checking some packages to save about 1GB of image size:
# From https://yihui.org/tinytex/faq/ FAQ #5:
# RUN wget -qO- "https://yihui.org/gh/tinytex/tools/install-unx.sh" \
#   | sh -s - --admin --no-path
# RUN mv /root/.TinyTeX/ /usr/local/lib/TinyTex
# RUN /usr/local/lib/TinyTex/bin/*/tlmgr path add
# RUN tlmgr install pdftexcmds 
# RUN tlmgr install kvoptions

RUN chmod -R a+w /usr/local/lib/R/site-library/ /usr/local/lib/R/library/