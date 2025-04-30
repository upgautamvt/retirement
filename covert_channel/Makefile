# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wno-unused-variable -Wno-unused-but-set-variable \
	-Wno-unused-function -Wno-maybe-uninitialized -Wno-uninitialized

# Source files in root directory (each builds to an executable)
ROOT_SRCS = $(wildcard *.c)
ROOT_EXES = $(ROOT_SRCS:.c=)

# Utility object files
SHARED_OBJ = utils/shared.o
CACHEUTILS_OBJ = utils/cacheutils.o

# Assembly output for all source files (including utils)
ASSEMBLY = $(ROOT_SRCS:.c=.s) \
	$(SHARED_OBJ:.o=.s) \
	$(CACHEUTILS_OBJ:.o=.s)

.PHONY: all clean asm

# Default target: build all executables and assembly
all: $(ROOT_EXES) asm

# Rule to compile each root .c into its executable, linking utilities
%: %.c $(SHARED_OBJ) $(CACHEUTILS_OBJ)
	$(CC) $(CFLAGS) -o $@ $^

# Rule to compile utils/shared.c into object
$(SHARED_OBJ): utils/shared.c utils/shared.h
	$(CC) $(CFLAGS) -c $< -o $@

# Rule to compile utils/cacheutils.c into object
$(CACHEUTILS_OBJ): utils/cacheutils.c utils/cacheutils.h
	$(CC) $(CFLAGS) -c $< -o $@

# Rule to generate assembly files
asm: $(ASSEMBLY)

%.s: %.c
	$(CC) $(CFLAGS) -S $< -o $@

# Clean up executables, object files, and assembly files
clean:
	rm -f $(ROOT_EXES) $(SHARED_OBJ) $(CACHEUTILS_OBJ) $(ASSEMBLY)
