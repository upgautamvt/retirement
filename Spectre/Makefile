# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wno-unused-variable -Wno-unused-but-set-variable -Wno-unused-function -Wno-maybe-uninitialized -Wno-uninitialized

# Find all .c files in the current directory
SOURCES = $(wildcard *.c)

# Generate the corresponding .o object files and .s assembly files
OBJECTS = $(SOURCES:.c=.o)
ASSEMBLY = $(SOURCES:.c=.s)

# Default target to build all executables and assembly files
all: $(SOURCES:.c=) $(ASSEMBLY)

# Rule to compile each .c file into an executable
%: %.c
	$(CC) $(CFLAGS) -o $@ $<

# Rule to generate .s assembly files
%.s: %.c
	$(CC) $(CFLAGS) -S $< -o $@

# Clean up object files, assembly files, and executables
clean:
	rm -f $(OBJECTS) $(ASSEMBLY) $(SOURCES:.c=)

.PHONY: all clean
