
GUILE_SRC := https://ftp.gnu.org/gnu/guile/guile-3.0.10.tar.xz

GUILE_DEPS := lib/gmp lib/libunistring lib/libgc lib/libffi

GUILE_CONFIG_ARGS = --prefix=$$(COSMOS)\
    --disable-shared --enable-static

$(eval $(call DOWNLOAD_SOURCE,compiler/guile,$(GUILE_SRC)))
$(eval $(call SPECIFY_DEPS,compiler/guile,$(GUILE_DEPS)))
$(eval $(call AUTOTOOLS_BUILD,compiler/guile,$(GUILE_CONFIG_ARGS),$(GUILE_CONFIG_ARGS)))

o/compiler/guile/built.fat: BINS = guile
