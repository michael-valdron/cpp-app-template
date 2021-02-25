MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
PROJECT_NAME := $(notdir $(patsubst %/,%,$(dir $(MKFILE_PATH))))
BUILD_PREFIX := out
BUILD_DIR := $(BUILD_PREFIX)/build
EXE := $(BUILD_DIR)/$(PROJECT_NAME)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)
	cmake . -B $(BUILD_DIR)
	make -C $(BUILD_DIR)

build: $(BUILD_DIR)
	
clean:
	rm -rf $(BUILD_PREFIX)

# debug: $(BUILD_DIR)
# 	gdb $(EXE)

run: rebuild
	$(EXE)

rebuild: clean build

.PHONY: build clean run rebuild
