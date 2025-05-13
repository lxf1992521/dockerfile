# docker build -t gns3-server:2.2.54 --no-cache --force-rm --network=host .
#
# docker run -d --name=gns3-server --network=host --restart=unless-stopped \
#               --cap-add=NET_ADMIN --device=/dev/net/tun --device=/dev/kvm \
#               -v /data/gns3:/data gns3-server:2.2.54

FROM python:3.12-alpine

# Docker 支持参考:
# - docker-run 添加 -v /var/run/docker.sock:/var/run/docker.sock
# - busybox static
#   https://github.com/GNS3/gns3-gui/issues/3569#issuecomment-2071983528
# - /gns3/init.sh 问题(目前没有优雅的解法，只能跑 DinD 来解决)
#   "/root/.local/share/GNS3/docker/resources:/gns3:ro",
#   "/data/projects/85660680-1304-4e3d-b59f-6cce62070eab/project-files/docker/7aff9f22-2bd7-4589-9eab-588b16687f44/etc/network:/gns3volumes/etc/network"

RUN apk add --no-cache libcap-setcap; \
    apk add --no-cache dynamips qemu-img qemu-system-x86_64 ubridge vpcs; \
    apk del libcap-setcap; \
    \
    apk add --no-cache gcc musl-dev linux-headers; \
    pip install --root-user-action=ignore --no-cache-dir gns3-server==2.2.54; \
    apk del gcc musl-dev linux-headers

CMD ["gns3server", "--profile", "/data/configs"]
