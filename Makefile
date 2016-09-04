.PHONY: clean install

all: clean
	git clone --depth 1 https://github.com/archlinuxarm/PKGBUILDs.git
	git apply --directory=PKGBUILDs linux-raspberrpi-slim.patch
	cd PKGBUILDs/core/linux-raspberrypi/ && updpkgsums && MAKELEVEL=0 makepkg -s

install:
	pacman -U PKGBUILDs/core/linux-raspberrypi/linux-raspberrypi-slim-headers*.xz
	pacman -U PKGBUILDs/core/linux-raspberrypi/linux-raspberrypi-slim-[^headers]*.xz

clean:
	rm -rf PKGBUILDs/
