default: main
.PHONY: default

CFLAGS = -O0 -g3 -I/usr/include/python3.8

include $(PUREC_DIR)/mk/target.mk

main: .spago

$(eval $(call purs_mk_target,main,Main,src))

check: main_leakcheck
.PHONY: check
