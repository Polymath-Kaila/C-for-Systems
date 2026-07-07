CC      := gcc
CFLAGS  := -std=c11 -Wall -Wextra -Wpedantic -Wshadow -Wconversion -g
ASAN    := -fsanitize=address,undefined
INCLUDE := -Iinclude

SRC := $(wildcard src/*.c)
OBJ := $(SRC:src/%.c=build/%.o)

.PHONY: all clean test asan tree

all:
	@echo "Build project-specific binaries inside projects/* for now."

build/%.o: src/%.c
	@mkdir -p build
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

asan:
	@echo "Use: gcc $(CFLAGS) $(ASAN) file.c -o bin/program"

test:
	@echo "Tests will be added as we build the modules."

tree:
	tree -a -I '.git|*.o|*.exe|bin'

clean:
	rm -rf build/*.o bin/*
