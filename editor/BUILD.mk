
include editor/emacs/BUILD.mk
include editor/vim/BUILD.mk
include editor/nano/BUILD.mk
include editor/neovim/BUILD.mk

editor: \
	o/editor/emacs/built.fat \
	o/editor/vim/built.fat \
	o/editor/nano/built.fat \
	o/editor/neovim/build.fat

.PHONY: editor
