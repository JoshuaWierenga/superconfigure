
LIBUV_SRC := https://github.com/libuv/libuv/archive/refs/tags/v1.48.0.tar.gz
LIBUV_CONFIG_ARGS = -DCMAKE_INSTALL_PREFIX=$$(COSMOS)\
    -DBUILD_SHARED_LIBS=OFF\
    -DCMAKE_C_FLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,lib/libuv,$(LIBUV_SRC)))
$(eval $(call CMAKE_BUILD,lib/libuv,$(LIBUV_CONFIG_ARGS),$(LIBUV_CONFIG_ARGS)))

o/lib/libuv/built.fat: BINS = neovim