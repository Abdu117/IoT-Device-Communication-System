# module/module.mk

CC = g++
CFLAGS = -Wall -Iinc
SRC = src/channel_factory.cpp src/channel.cpp src/socket_factory.cpp src/socket.cpp
OBJ = $(SRC:src/%.cpp=../Application/out/gen/%.o)
LIB_DIR = ../Application/out/lib

all: $(LIB_DIR)/libmodule.a

# Target to create the static library
$(LIB_DIR)/libmodule.a: $(OBJ)
	mkdir -p $(LIB_DIR)  # Ensure the lib directory exists
	ar rcs $(LIB_DIR)/libmodule.a $(OBJ)

# Target to compile each .cpp file to .o
../Application/out/gen/%.o: src/%.cpp
	mkdir -p ../Application/out/gen  # Ensure the out directory exists
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ) $(LIB_DIR)/libmodule.a
