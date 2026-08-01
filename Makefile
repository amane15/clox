CC = gcc
CFLAGS = -Wall -Wextra -std=c17 -Iinclude -MMD -MP

SRC = $(wildcard src/*.c)
OBJ = $(SRC:src/%.c=obj/%.o)
DEP = $(OBJ:.o=.d)

TARGET = bin/clox

$(TARGET): $(OBJ)
	mkdir -p bin
	$(CC) $(OBJ) -o $(TARGET)

obj/%.o: src/%.c 
	mkdir -p obj
	$(CC) $(CFLAGS) -c $< -o $@

-include $(DEP)

clean:
	rm -rf obj bin

.PHONY: clean
