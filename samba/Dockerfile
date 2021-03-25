FROM alpine:3.12.3
RUN addgroup -g 1000 user && adduser -u 1000 -G user -s /sbin/nologin -S -D -H user
RUN apk add --update samba-server && rm -rf /var/cache/apk/*
COPY smb.conf /etc/samba/smb.conf
ENTRYPOINT ["smbd", "--foreground", "--log-stdout", "--no-process-group"]
