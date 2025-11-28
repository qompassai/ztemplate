# Compiler and flags
CC       := zig cc
CFLAGS   := -target native-linux-gnu -O3 -march=native -fPIC -flto -D_FORTIFY_SOURCE=2 -fstack-protector-strong -Wall -Wextra -Wpedantic -Wno-unused-but-set-variable
LDFLAGS  := -O1 -Wl,--as-needed -Wl,-z,relro -Wl,-z,now

# Paths
SRC      := main.c
BIN      := cso-thumbnailer

# Default target
all: $(BIN)

$(BIN): $(SRC)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $(BIN) $(SRC)

clean:
	rm -f $(BIN)

.PHONY: all clean

