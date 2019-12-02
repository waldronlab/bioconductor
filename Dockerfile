FROM bioconductor/bioconductor_full:devel

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    texinfo \
    htop \
    locate \
    tree \
    tmux \
    vim

# From https://yihui.org/tinytex/faq/ FAQ #5:
RUN wget -qO- "https://yihui.org/gh/tinytex/tools/install-unx.sh" \
  | sh -s - --admin --no-path
RUN mv /root/.TinyTeX/ /usr/local/lib/TinyTex
RUN /usr/local/lib/TinyTex/bin/*/tlmgr path add
RUN tlmgr install pdftexcmds 
RUN tlmgr install kvoptions

RUN chmod -R a+w /usr/local/lib/R/site-library/ /usr/local/lib/R/library/