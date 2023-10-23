# docker build -t lxf1992521/libvirtd:debian --no-cache --force-rm --network=host .
#
# docker run -d --restart=unless-stopped --network=host --privileged --name libvirtd --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro --volume=/etc/localtime:/etc/localtime:ro --volume=/data/system/libvirt:/var/lib/libvirt lxf1992521/libvirtd:debian

FROM lxf1992521/systemd:debian

RUN apt-get -qq update; \
    apt-get -qq --no-install-recommends install libvirt-daemon-system virtinst qemu-system-x86 qemu-utils dnsmasq-base cpio curl; \
      sed -i "/Environment/a ExecStartPre=/bin/chown libvirt-qemu: /dev/kvm" /lib/systemd/system/libvirtd.service ; \
      sed -i "/Environment/a ExecStartPre=/bin/sh -c 'echo `id -g libvirt-qemu` `id -g libvirt-qemu` > /proc/sys/net/ipv4/ping_group_range'" /lib/systemd/system/libvirtd.service ; \
      sed -i "/Environment/a ExecStartPre=/bin/sh -c 'test -d /var/lib/libvirt/conf || mv /etc/libvirt /var/lib/libvirt/conf; rm -rf /etc/libvirt; ln -s /var/lib/libvirt/conf /etc/libvirt'" /lib/systemd/system/libvirtd.service ; \
    rm /sbin/poweroff /sbin/shutdown /sbin/reboot ; \
    apt-get clean all; \
    find /run /tmp /var/tmp /var/lib/apt/lists -mindepth 1 -delete
