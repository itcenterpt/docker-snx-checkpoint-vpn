FROM ubuntu:18.04

WORKDIR /root

RUN dpkg --add-architecture i386 && \
	apt-get update && \
	apt-get install -y bzip2 kmod libstdc++5:i386 \
		libpam0g:i386 libx11-6:i386 expect iptables \
		net-tools iputils-ping iproute2 && \
		rm -rf /var/lib/apt/lists/*

COPY scripts/snx_install.sh .
RUN bash -x snx_install.sh

COPY scripts/cmd.sh .
RUN chmod +x /root/cmd.sh

CMD ["/root/cmd.sh"]
