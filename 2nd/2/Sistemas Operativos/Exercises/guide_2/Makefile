SHELL       = /bin/sh
detected_OS := $(shell sh -c 'uname -s 2>/dev/null || echo not')
CC          = gcc
LD          = gcc
CFLAGS      = -std=c11 -O2 -Wall -Wextra -Wno-unused-parameter -Wno-unused-function -Wno-unused-result -pedantic -g

BIN_DIR    = bin
SRC_DIR    = src
DOC_DIR    = docs
BLD_DIR    = build
SRC        = $(wildcard $(SRC_DIR)/*.c)
OBJ        = $(patsubst $(SRC_DIR)/%.c,$(BLD_DIR)/%.o,$(SRC))
DEPS       = $(patsubst $(BLD_DIR)/%.o,$(BLD_DIR)/%.d,$(OBJ))
PROGRAM    = guide2

vpath %.c $(SRC_DIR)

.DEFAULT_GOAL = all

.PHONY: run fmt lint leak-check doc checkdirs all clean

$(BLD_DIR)/%.d: %.c
	$(CC) -M $(CFLAGS) $(INCLUDES) $< -o $@

$(BLD_DIR)/%.o: %.c
	$(CC) -c $(CFLAGS) $(INCLUDES) $< -o $@

$(BIN_DIR)/$(PROGRAM): $(DEPS) $(OBJ)
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ $(OBJ)

run: $(BIN_DIR)/$(PROGRAM)
	@./$(BIN_DIR)/$(PROGRAM)

fmt:
	@uncrustify -c .uncrustify --no-backup $(SRC_DIR)/*.c

lint:
	@splint -retvalint -I $(SRC_DIR)/*.c,*.h

leak-check: $(BIN_DIR)/$(PROGRAM)
	@valgrind --vgdb=no --tool=memcheck --leak-check=yes ./$(BIN_DIR)/$(PROGRAM) $(input)

doc:
	@doxygen

test:
	@echo "Write some tests!"

checkdirs:
	@mkdir -p $(BLD_DIR)
	@mkdir -p $(BIN_DIR)
	@mkdir -p $(DOC_DIR)

all: checkdirs $(BIN_DIR)/$(PROGRAM)

clean:
	@echo "Cleaning..."
	@echo ""
	@-cat .art/maid.ascii
	@-rm -rd $(BLD_DIR)/* $(BIN_DIR)/* $(DOC_DIR)/*
	@echo ""
	@echo "...✓ done!"
