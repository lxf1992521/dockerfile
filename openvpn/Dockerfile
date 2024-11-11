# docker build -t openvpn:2.4.12 --force-rm --no-cache --network=host .
# 1. 运行时必须添加 --cap-add NET_ADMIN 容器参数
# 2. 在容器内部手动创建 tun 字符设备：mkdir -p /dev/net && mknod /dev/net/tun c 10 200
#    或者直接将宿主机的 tun 字符设备 /dev/net/tun 挂载到容器内 /dev/net/tun
#

FROM centos:7.9.2009

RUN sed -e 's|^mirrorlist=|#mirrorlist=|' \
        -e 's|^#baseurl=|baseurl=|' \
        -e 's|mirror.centos.org|mirrors.huaweicloud.com|' \
        -i /etc/yum.repos.d/CentOS-Base.repo; \
    yum install -q -y epel-release; \
    sed -e 's|^metalink|#metalink|' \
        -e 's|^#baseurl=|baseurl=|' \
        -e 's|download.fedoraproject.org/pub|mirrors.huaweicloud.com|' \
        -i /etc/yum.repos.d/epel.repo; \
    yum install -q -y openvpn; \
    yum clean all; \
    rm -rf /var/cache/yum

CMD /usr/sbin/openvpn --config /etc/openvpn/openvpn.conf
