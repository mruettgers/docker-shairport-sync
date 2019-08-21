FROM arm32v7/alpine:3
MAINTAINER Michael Ruettgers <michael@ruettgers.eu>

ENV BUILD_PACKAGES \
  git \
  build-base \
  autoconf \
  automake \
  libtool \
  libdaemon-dev \
  popt-dev \
  libressl-dev \
  soxr-dev \
  avahi-dev \
  libconfig-dev

ENV PACKAGES \
  libdaemon \
  libgcc \
  popt \
  libressl \
  soxr \
  libconfig

RUN set -xe && \
  apk --no-cache add ${BUILD_PACKAGES} ${PACKAGES} && \
  cd /tmp && \
  git clone --recursive https://github.com/mikebrady/shairport-sync.git && \
  cd /tmp/shairport-sync && \
  autoreconf -i -f && \
  ./configure \
    --with-tinysvcmdns \
    --with-pipe \
    --with-ssl=openssl \
    --with-soxr && \
  make && \
  make install && \
  cd /tmp && \
  rm -rf /tmp/shairport-sync && \
  apk --no-cache --purge del ${BUILD_PACKAGES}

COPY ./files/ /

ENTRYPOINT ["/docker/docker-entrypoint.sh"]
