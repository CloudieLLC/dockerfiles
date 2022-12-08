FROM debian:bullseye-slim
LABEL version="alpha"

RUN apt-get update && apt-get install -y \
    --no-install-recommends \
    autoconf \
    bison \
    build-essential \
    curl \
    flex \
    libreadline-dev \
    libncurses5-dev \
    m4 \
    ca-certificates \
    procps \
    git \
    libtool \
    autoconf \
    automake \
    markdown \
    dos2unix \
    unzip  && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

RUN curl https://repo.pathvector.io/pgp.asc > /usr/share/keyrings/pathvector.asc
RUN echo "deb [signed-by=/usr/share/keyrings/pathvector.asc] https://repo.pathvector.io/apt/ stable main" > /etc/apt/sources.list.d/pathvector.list

RUN apt-get update && apt-get install -y \
    --no-install-recommends \
    pathvector && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root
RUN curl -O -L ftp://bird.network.cz/pub/bird/bird-2.0.10.tar.gz
RUN tar -xvzf bird-2.0.10.tar.gz

RUN mkdir /etc/bird

RUN cd bird-2.0.10 && \
    autoreconf && \
    ./configure && \
    make && \
    make install

RUN git clone https://github.com/bgp/bgpq4.git /src
WORKDIR /src
# Run steps
RUN ./bootstrap
RUN ./configure
RUN make install

RUN rm -rf /root/bird-2.0.10

COPY dockerfiles/bird2-/pathvector/bgpq4/root/ /root/

RUN chmod +x /root/run.sh

CMD /root/run.sh