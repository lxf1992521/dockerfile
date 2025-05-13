# docker build --force-rm --no-cache --network=host -t ubuntu-build .
FROM ubuntu:16.04

RUN apt-get -qq update; \
    apt-get -qq dist-upgrade; \
    apt-get --no-install-recommends -qq install perl-modules-5.22; \
    apt-get --no-install-recommends -qq install \
      bash-completion less tree vim wget curl ca-certificates bsdmainutils \
      command-not-found devscripts dpkg-dev fakeroot libfile-fcntllock-perl \
      apt-transport-https ubuntu-cloud-keyring; \
    apt-get clean all; \
    rm -f /etc/apt/apt.conf.d/docker-clean /etc/apt/apt.conf.d/docker-gzip-indexes
