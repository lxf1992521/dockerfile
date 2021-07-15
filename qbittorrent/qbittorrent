FROM alpine:3
ENV qb_version=4.3.6.10
RUN wget https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/download/release-${qb_version}/qbittorrent-nox_x86_64-linux-musl_static.zip && unzip qbittorrent-nox_x86_64-linux-musl_static.zip && unlink qbittorrent-nox_x86_64-linux-musl_static.zip
RUN addgroup -g 1000 user && adduser -u 1000 -G user -s /sbin/nologin -D user && mkdir -m 1777 /data
USER user
RUN mkdir -p /home/user/.config/qBittorrent/ && printf '[LegalNotice]\nAccepted=true\n' > /home/user/.config/qBittorrent/qBittorrent.conf
CMD ["/qbittorrent-nox"]
