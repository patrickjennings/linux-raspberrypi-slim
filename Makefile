.PHONY: clean install

all: clean
	git clone --depth 1 https://github.com/archlinuxarm/PKGBUILDs.git
	git apply --directory=PKGBUILDs linux-raspberrpi-slim.patch
	cd PKGBUILDs/core/linux-raspberrypi/ && updpkgsums && makepkg -s

install:
	pacman -U core/linux-raspberrypi/linux-raspberrypi-slim-headers*.xz
	pacman -U core/linux-raspberrypi/linux-raspberrypi-slim-[^headers]*.xz

clean:
	git clean -fdx
