
NEOVIM_SRC := https://github.com/neovim/neovim/archive/refs/tags/v0.9.5.tar.gz
NEOVIM_DEPS := lang/lua lib/libuv
NEOVIM_CONFIG_ARGS = -DCMAKE_INSTALL_PREFIX=$$(COSMOS)\
    -DBUILD_SHARED_LIBS=OFF\
    -DCMAKE_C_FLAGS="-Os"

$(eval $(call DOWNLOAD_SOURCE,editor/neovim,$(NEOVIM_SRC)))
$(eval $(call SPECIFY_DEPS,editor/neovim,$(NEOVIM_DEPS)))
$(eval $(call CMAKE_BUILD,editor/neovim,$(NEOVIM_CONFIG_ARGS),$(NEOVIM_CONFIG_ARGS)))

o/editor/neovim/built.fat: BINS = neovim