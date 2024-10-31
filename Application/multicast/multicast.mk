# multicast/multicast.mk

CC = g++
CFLAGS = -Wall -I../../module/inc   # Ensure the include path is correct
SRC = client1.cpp client2.cpp server_multicast.cpp
OBJ = $(SRC:%.cpp=../out/gen/%.o)
OUT_DIR = .

all: $(OUT_DIR)/client1_out $(OUT_DIR)/client2_out $(OUT_DIR)/server_multicast_out

$(OUT_DIR)/client1_out: ../out/gen/client1.o
	$(CC) $(CFLAGS) ../out/gen/client1.o -o $(OUT_DIR)/client1_out -L../out/lib -lmodule

$(OUT_DIR)/client2_out: ../out/gen/client2.o
	$(CC) $(CFLAGS) ../out/gen/client2.o -o $(OUT_DIR)/client2_out -L../out/lib -lmodule

$(OUT_DIR)/server_multicast_out: ../out/gen/server_multicast.o
	$(CC) $(CFLAGS) ../out/gen/server_multicast.o -o $(OUT_DIR)/server_multicast_out -L../out/lib -lmodule

# Rule to compile .cpp files into .o files in ../out
../out/gen/%.o: %.cpp
	mkdir -p ../out/gen    # Ensure the out directory exists
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OUT_DIR)/client1_out $(OUT_DIR)/client2_out $(OUT_DIR)/server_multicast_out
	rm -f ../out/gen/client1.o ../out/gen/client2.o ../out/gen/server_multicast.o
