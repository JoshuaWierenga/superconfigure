
include gui/libX11/BUILD.mk
include gui/libXau/BUILD.mk
include gui/libxcb/BUILD.mk
include gui/libXext/BUILD.mk
include gui/xcb-proto/BUILD.mk
include gui/xorgproto/BUILD.mk
include gui/xtrans/BUILD.mk
include gui/util-macros/BUILD.mk
include gui/SDL2/BUILD.mk
include gui/SDL2_image/BUILD.mk
include gui/SDL2_net/BUILD.mk
include gui/SDL2_ttf/BUILD.mk

gui:\
	o/gui/libX11/built.fat \
	o/gui/libXau/built.fat \
	o/gui/libxcb/built.fat \
	o/gui/libXext/built.fat \
	o/gui/xcb-proto/built.fat \
	o/gui/xorgproto/built.fat \
	o/gui/xtrans/built.fat \
	o/gui/util-macros/built.fat \
	o/gui/SDL2/built.fat \
	o/gui/SDL2_image/built.fat \
	o/gui/SDL2_net/built.fat \
	o/gui/SDL2_ttf/built.fat
.PHONY: gui
