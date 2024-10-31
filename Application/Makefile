# Application/Makefile.mk

.PHONY: all clean unicast multicast module

all: module unicast multicast  # Build module first to ensure libmodule.a is available

unicast:
	$(MAKE) -C unicast -f unicast.mk

multicast:
	$(MAKE) -C multicast -f multicast.mk

module:
	$(MAKE) -C ../module -f module.mk

clean:
	$(MAKE) -C unicast -f unicast.mk clean
	$(MAKE) -C multicast -f multicast.mk clean
	$(MAKE) -C ../module -f module.mk clean
	rm -rf out/gen/*.o out/lib/*.a

