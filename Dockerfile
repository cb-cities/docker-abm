FROM fedora:latest
MAINTAINER Krishna Kumar <kks32@cam.ac.uk>

# Dependencies
RUN dnf install -y bzip2 findutils gcc git gmp-devel make ncurses perl tar which xz zlib zlib-devel \
  && dnf clean all

# Create a softlink for libgmp.so.3 & libtinfo.so.
RUN ln -s /usr/lib64/libgmp.so  /usr/lib64/libgmp.so.3  && ln -s /usr/lib64/libtinfo.so.6 /usr/lib64/libtinfo.so.5

# GHC
RUN mkdir -p /usr/src/ghc \
  && cd /usr/src/ghc \
  && curl --silent -O http://downloads.haskell.org/~ghc/8.0.1/ghc-8.0.1-x86_64-centos67-linux.tar.xz \
  && tar --strip-components=1 -xJf ghc-8.0.1-x86_64-centos67-linux.tar.xz \
  && rm -f ghc-8.0.1-x86_64-centos67.tar.xz \
  && ./configure --prefix=/opt/ghc \
  && make install \
  && rm -rf /usr/src/ghc \
  && /opt/ghc/bin/ghc --version

ENV PATH /opt/ghc/bin:$PATH

# Cabal
RUN mkdir -p /usr/src/cabal \
  && cd /usr/src/cabal \
  && curl --silent -O https://www.haskell.org/cabal/release/cabal-install-1.24.0.0/cabal-install-1.24.0.0.tar.gz \
  && tar --strip-component=1 -xzf cabal-install-1.24.0.0.tar.gz \
  && rm -f cabal-install-1.24.0.0.tar.gz \
  && /usr/src/cabal/bootstrap.sh \
  && cp /root/.cabal/bin/cabal /opt/ghc/bin \
  && for pkg in `ghc-pkg --user list  --simple-output`; do ghc-pkg unregister --force $pkg; done \
  && rm -rf /root/.cabal \
  && rm -rf /usr/src/cabal \
  && cabal --version 

# NodeJS, NPM, Elm and Purescript
RUN dnf install -y nodejs \
  && npm install -g n \
  && n stable \
  && npm install -g purescript \
  && npm install -g elm@0.16 \
  && dnf clean all

# Create a user abm
RUN useradd abm
USER abm

# GML Explorer
RUN cd && mkdir -p /home/abm/ && git clone https://github.com/cb-geo/gml-explorer.git && cd gml-explorer && cabal update && make

# Done
WORKDIR /home/abm
