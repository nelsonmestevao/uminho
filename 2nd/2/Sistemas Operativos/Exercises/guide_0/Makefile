CC      = gcc
LD      = gcc
CFLAGS  = -O2 -Wall -Wextra -Wno-unused-parameter -Wno-unused-function -Wno-unused-result -pedantic -g
BIN_DIR = bin
BLD_DIR = build
LOG_DIR = log
OUT_DIR = out
SRC_DIR = src
TST_DIR = tests
SRC     = $(wildcard $(SRC_DIR)/*.c)
OBJS    = $(patsubst $(SRC_DIR)/%.c,$(BLD_DIR)/%.o,$(SRC))
DEPS    = $(patsubst $(BLD_DIR)/%.o,$(BLD_DIR)/%.d,$(OBJS))
PROGRAM = pessoas

vpath %.c $(SRC_DIR)

.DEFAULT_GOAL = build

.PHONY: build run fmt lint check test checkdirs clean

$(BLD_DIR)/%.d: %.c
	$(CC) -M $(CFLAGS) $(INCLUDES) $< -o $@

$(BLD_DIR)/%.o: %.c
	$(CC) -c $(CFLAGS) $(INCLUDES) $< -o $@

$(BIN_DIR)/$(PROGRAM): $(DEPS) $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ $(OBJS)

build: checkdirs $(BIN_DIR)/$(PROGRAM)

run: build
	@./$(BIN_DIR)/$(PROGRAM)

fmt:
	@echo "C and Headers files:"
	@-clang-format -verbose -style="{BasedOnStyle: Google, IndentWidth: 4}" -i $(SRC_DIR)/*.c $(SRC_DIR)/*.h
	@echo "Shell files:"
	@-shfmt -l -s -w -i 2 .

lint:
	@splint -retvalint -hints -strict -I $(SRC_DIR)/*.c $(SRC_DIR)/*.h

test:
	@./$(TST_DIR)/generate-people.sh

checkdirs:
	@mkdir -p $(BLD_DIR)
	@mkdir -p $(BIN_DIR)
	@mkdir -p $(LOG_DIR)
	@mkdir -p $(OUT_DIR)

clean:
	@echo "Cleaning..."
	@echo ""
	@-rm -rd $(BLD_DIR)/* $(BIN_DIR)/* $(OUT_DIR)/* $(LOG_DIR)/*
	@echo ""
	@echo "...✓ done!"

