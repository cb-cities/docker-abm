FROM fedora:23
MAINTAINER Krishna Kumar <kks32@cam.ac.uk>

# Dependencies
RUN dnf install -y bzip2 gcc git gmp-devel make perl tar which zlib zlib-devel

# Create a softlink for libgmp.so.3
RUN ln -s /usr/lib64/libgmp.so  /usr/lib64/libgmp.so.3 

# GHC
RUN mkdir -p /usr/src/ghc
WORKDIR /usr/src/ghc

RUN curl --silent -O https://downloads.haskell.org/~ghc/7.10.3/ghc-7.10.3-x86_64-centos67-linux.tar.bz2 \
  && echo 'a8957f7a2fd81720c5d3dc403571d77d31115ff5f42edb2917c36d8e714220d4 ghc-7.10.3-x86_64-centos67-linux.tar.bz2' | sha256sum -c - \
  && tar --strip-components=1 -xjf ghc-7.10.3-x86_64-centos67-linux.tar.bz2 \
  && rm -f ghc-7.10.3-x86_64-centos67-linux.tar.bz2 \
  && ./configure --prefix=/opt/ghc \
  && make install \
  && rm -rf /usr/src/ghc \
  && /opt/ghc/bin/ghc --version

ENV PATH /opt/ghc/bin:$PATH

# Cabal
RUN mkdir -p /usr/src/cabal
WORKDIR /usr/src/cabal

RUN curl --silent -O https://www.haskell.org/cabal/release/cabal-install-1.22.2.0/cabal-install-1.22.2.0.tar.gz \
  && echo '25bc2ea88f60bd0f19bf40984ea85491461973895480b8633d87f54aa7ae6adb  cabal-install-1.22.2.0.tar.gz' | sha256sum -c - \
  && tar --strip-component=1 -xzf cabal-install-1.22.2.0.tar.gz \
  && rm -f cabal-install-1.22.2.0.tar.gz \
  && /usr/src/cabal/bootstrap.sh \
  && cp /root/.cabal/bin/cabal /opt/ghc/bin \
  && for pkg in `ghc-pkg --user list  --simple-output`; do ghc-pkg unregister --force $pkg; done \
  && rm -rf /root/.cabal \
  && rm -rf /usr/src/cabal \
  && cabal --version

# Done
WORKDIR /root
