# docker build --force-rm --no-cache --network=host -t ubuntu-build .
FROM ubuntu:16.04
ENV REPO=mirrors.aliyun.com BRANCH="main universe multiverse"
RUN printf "deb http://$REPO/ubuntu/ xenial $BRANCH\ndeb http://$REPO/ubuntu/ xenial-updates $BRANCH" > /etc/apt/sources.list && \
    apt-get -qq update && apt-get -y --no-install-recommends dist-upgrade && \
    apt-get --no-install-recommends install -y bash-completion vim wget curl bsdmainutils command-not-found devscripts dpkg-dev fakeroot && \
    apt-get clean all
RUN rm -f /etc/apt/apt.conf.d/docker-clean /etc/apt/apt.conf.d/docker-gzip-indexes
