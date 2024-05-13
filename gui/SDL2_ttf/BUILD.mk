
# TODO: Add halfbuzz?

SDL2_ttf_SRC := https://github.com/libsdl-org/SDL_ttf/releases/download/release-2.22.0/SDL2_ttf-2.22.0.tar.gz
SDL2_ttf_DEPS := gui/SDL2 lib/freetype
SDL2_ttf_CONFIG_ARGS := --prefix="$$(COSMOS)"\
   --disable-freetype-builtin --disable-harfbuzz\
   CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,gui/SDL2_ttf,$(SDL2_ttf_SRC)))
$(eval $(call SPECIFY_DEPS,gui/SDL2_ttf,$(SDL2_ttf_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,gui/SDL2_ttf,$(SDL2_ttf_CONFIG_ARGS),$(SDL2_ttf_CONFIG_ARGS)))

o/gui/SDL2_ttf/setup: o/gui/SDL2_ttf/patched
	cd $(BASELOC)/o/gui/SDL2_ttf/SDL2_ttf-2.22.0 && aclocal --force && autoconf --force
	touch $@

o/gui/SDL2_ttf/configured.x86_64: o/gui/SDL2_ttf/setup
o/gui/SDL2_ttf/configured.aarch64: o/gui/SDL2_ttf/setup

o/gui/SDL2_ttf/installed.x86_64: INSTALL_COMMAND = $(INSTALL_DEFAULT) && \
    cp showfont $(COSMOS)/bin/

o/gui/SDL2_ttf/installed.aarch64: INSTALL_COMMAND = $(INSTALL_DEFAULT) && \
    cp showfont $(COSMOS)/bin/

o/gui/SDL2_ttf/built.fat: BINS = showfont
