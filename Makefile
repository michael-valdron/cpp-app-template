ifdef DEBUG
DEBUG := -g
TASK := debug
else
TASK := run
endif

BUILD_CMD := g++ $(DEBUG) -std=c++11
CC_FILES := $(wildcard src/*.cc)
OBJ_FILES := $(patsubst src/%.cc,obj/%.o,$(CC_FILES))

obj/%.o: src/%.cc
	mkdir -p obj/
	$(BUILD_CMD) -c -o $@ $<

build: $(OBJ_FILES)
	mkdir -p bin/
	$(BUILD_CMD) obj/*.o -o bin/linked_list

clean:
	rm -rf obj/
	rm -rf bin/

debug:
	gdb ./bin/$(EXE_FILENAME)

run:
	./bin/$(EXE_FILENAME)

rebuild: clean build

all: rebuild $(TASK)