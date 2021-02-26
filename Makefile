# cpp-app-template
# Michael Valdron
# Feb. 26, 2021

# Definitions
MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
PROJECT_NAME := $(notdir $(patsubst %/,%,$(dir $(MKFILE_PATH))))
BUILD_PREFIX := out
BUILD_DIR := $(BUILD_PREFIX)/build
EXE := $(BUILD_DIR)/$(PROJECT_NAME)

# Tasks
## Build task
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)
	cmake . -B $(BUILD_DIR)
	make -C $(BUILD_DIR)

build: $(BUILD_DIR)

## Clean task	
clean:
	rm -rf $(BUILD_PREFIX)

## Debug task
# debug: $(BUILD_DIR)
# 	gdb $(EXE)

## Run task
run:
	$(EXE)

## Rebuild task
rebuild: clean build

## PHONY names
.PHONY: build clean run rebuild
