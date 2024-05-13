
SDL2_net_SRC := https://github.com/libsdl-org/SDL_net/releases/download/release-2.2.0/SDL2_net-2.2.0.tar.gz
SDL2_net_DEPS := gui/SDL2
SDL2_net_CONFIG_ARGS := --prefix="$$(COSMOS)"\
   CFLAGS="-Os -D_BSD_SOURCE"

$(eval $(call DOWNLOAD_SOURCE,gui/SDL2_net,$(SDL2_net_SRC)))
$(eval $(call SPECIFY_DEPS,gui/SDL2_net,$(SDL2_net_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,gui/SDL2_net,$(SDL2_net_CONFIG_ARGS),$(SDL2_net_CONFIG_ARGS)))

o/gui/SDL2_net/setup: o/gui/SDL2_net/patched
	cd $(BASELOC)/o/gui/SDL2_net/SDL2_net-2.2.0 && aclocal --force && autoconf --force
	touch $@

o/gui/SDL2_net/configured.x86_64: o/gui/SDL2_net/setup
o/gui/SDL2_net/configured.aarch64: o/gui/SDL2_net/setup

o/gui/SDL2_net/built.fat: FATTEN_COMMAND = $(DUMMYLINK0)
