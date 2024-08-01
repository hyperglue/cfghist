all:
	@echo "Run 'make install' to install"

install:
	install -m 755 -d /usr/local/bin
	install -m 755 -d /usr/local/sbin
	install -m 755 config /usr/local/sbin
	install -m 755 zfs-snapshot /usr/local/sbin
	install -m 755 zfs-get-dataset-by-mountpoint /usr/local/bin 

