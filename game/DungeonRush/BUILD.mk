
# TODO: Add audio support to SDL, add SDL_mixer, and then remove patch

DUNGEONRUSH_SRC := https://github.com/rapiz1/DungeonRush/archive/refs/tags/v1.1-beta.tar.gz
DUNGEONRUSH_DEPS := gui/SDL2_image gui/SDL2_net gui/SDL2_ttf
DUNGEONRUSH_CONFIG_ARGS = -DCMAKE_INSTALL_PREFIX=$$(COSMOS)\
    -DBUILD_SHARED_LIBS=OFF\
    -DSDL2_INCLUDE_DIR=$$(COSMOS)\
    -DCMAKE_C_FLAGS="-Os -DSOFTWARE_ACC"

$(eval $(call DOWNLOAD_SOURCE,game/DungeonRush,$(DUNGEONRUSH_SRC)))
$(eval $(call SPECIFY_DEPS,game/DungeonRush,$(DUNGEONRUSH_DEPS)))
$(eval $(call CMAKE_BUILD,game/DungeonRush,$(DUNGEONRUSH_CONFIG_ARGS),$(DUNGEONRUSH_CONFIG_ARGS)))

o/game/DungeonRush/installed.x86_64: INSTALL_COMMAND = cp -r bin $(COSMOS)/
o/game/DungeonRush/installed.aarch64: INSTALL_COMMAND = cp -r bin $(COSMOS)/

o/game/DungeonRush/built.fat: BINS = dungeon_rush
