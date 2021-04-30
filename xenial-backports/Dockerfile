# docker build --force-rm --no-cache --network=host -t ubuntu-build .
FROM ubuntu:16.04
RUN apt-get -qq update && \
    apt-get -qq --no-install-recommends dist-upgrade && \
    apt-get -qq --no-install-recommends install bash-completion vim wget curl bsdmainutils command-not-found devscripts dpkg-dev fakeroot && \
    apt-get clean all
RUN rm -f /etc/apt/apt.conf.d/docker-clean /etc/apt/apt.conf.d/docker-gzip-indexes
