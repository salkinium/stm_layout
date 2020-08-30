.PHONY: all
all: tgcurses modm_devices


tgcurses:
	@git clone https://github.com/tgree/tgcurses tgcurses.git
	@ln -s tgcurses.git/tgcurses


modm-devices:
	@git clone https://github.com/modm-io/modm-devices


.xml: modm-devices
	@cd modm-devices/tools/generator && make init
	@cd modm-devices/tools/generator && make extract-stm32
	@cd modm-devices/tools/generator && make generate-stm32
	@touch .xml


modm_devices: modm-devices
	@ln -s modm-devices/modm_devices


clean:
	@rm -rf tgcurses modm-devices .xml 2>/dev/null or true
