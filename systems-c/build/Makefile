# ===== MinGW Makefile (run from repo root) =====
CC      := gcc
CSTD    := -std=c11
WARN    := -Wall -Wextra -Wpedantic -Werror
DBG     := -O0 -g
INCS    := -Iinclude

CFLAGS  := $(CSTD) $(WARN) $(DBG) $(INCS)

BIN_DIR := bin
EXE     := .exe

.PHONY: all clean dirs hello run-hello

all: hello

dirs:
	@mkdir $(BIN_DIR) 2>NUL || exit 0

hello: dirs
	$(CC) $(CFLAGS) examples/hello.c -o $(BIN_DIR)/hello$(EXE)

run-hello: hello
	$(BIN_DIR)/hello$(EXE)

clean:
	@rmdir /S /Q $(BIN_DIR) 2>NUL || exit 0