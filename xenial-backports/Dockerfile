# docker build --force-rm --no-cache --network=host -t ubuntu-build .
FROM ubuntu:16.04

# RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5EDB1B62EC4926EA
# RUN echo "deb http://ubuntu-cloud.archive.canonical.com/ubuntu xenial-updates/queens main" > /etc/apt/sources.list.d/cloudarchive-queens.list
RUN apt-get -qq update; \
    apt-get -qq dist-upgrade; \
    apt-get --no-install-recommends -qq install perl-modules-5.22; \
    apt-get --no-install-recommends -qq install \
      bash-completion vim wget curl ca-certificates bsdmainutils \
      command-not-found devscripts dpkg-dev fakeroot libfile-fcntllock-perl \
      apt-transport-https; \
    apt-get clean all; \
    rm -f /etc/apt/apt.conf.d/docker-clean /etc/apt/apt.conf.d/docker-gzip-indexes
