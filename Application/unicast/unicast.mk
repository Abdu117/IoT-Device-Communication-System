# unicast/unicast.mk

CC = g++
CFLAGS = -Wall -I../../module/inc   # Updated path to include module/inc
SRC = client.cpp server.cpp
OBJ = $(SRC:%.cpp=../out/gen/%.o)
LIB_DIR = ../out/lib
OUT_DIR = .

all: $(OUT_DIR)/client_out $(OUT_DIR)/server_out

$(OUT_DIR)/client_out: ../out/gen/client.o
	$(CC) $(CFLAGS) ../out/gen/client.o -o $(OUT_DIR)/client_out -L$(LIB_DIR) -lmodule

$(OUT_DIR)/server_out: ../out/gen/server.o
	$(CC) $(CFLAGS) ../out/gen/server.o -o $(OUT_DIR)/server_out -L$(LIB_DIR) -lmodule

../out/gen/%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OUT_DIR)/client_out $(OUT_DIR)/server_out
	rm -f ../out/gen/client.o ../out/gen/server.o

