
# TODO: Use superconfigure's libtiff

SDL2_image_SRC := https://github.com/libsdl-org/SDL_image/releases/download/release-2.8.2/SDL2_image-2.8.2.tar.gz
SDL2_image_DEPS := gui/SDL2
SDL2_image_CONFIG_ARGS := --prefix="$$(COSMOS)"\
   --disable-avif --disable-jxl --disable-tif --disable-webp \
   CFLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,gui/SDL2_image,$(SDL2_image_SRC)))
$(eval $(call SPECIFY_DEPS,gui/SDL2,$(SDL2_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,gui/SDL2_image,$(SDL2_image_CONFIG_ARGS),$(SDL2_image_CONFIG_ARGS)))

o/gui/SDL2_image/setup: o/gui/SDL2_image/patched
	cd $(BASELOC)/o/gui/SDL2_image/SDL2_image-2.8.2 && aclocal --force && autoconf --force
	touch $@

o/gui/SDL2_image/configured.x86_64: o/gui/SDL2_image/setup
o/gui/SDL2_image/configured.aarch64: o/gui/SDL2_image/setup

o/gui/SDL2_image/installed.x86_64: INSTALL_COMMAND = $(INSTALL_DEFAULT) && \
    cp showanim showimage $(COSMOS)/bin/

o/gui/SDL2_image/installed.aarch64: INSTALL_COMMAND = $(INSTALL_DEFAULT) && \
    cp showanim showimage $(COSMOS)/bin/

o/gui/SDL2_image/built.fat: BINS = showanim showimage
