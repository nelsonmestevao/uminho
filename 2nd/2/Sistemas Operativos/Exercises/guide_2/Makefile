SHELL       = /bin/sh
detected_OS := $(shell sh -c 'uname -s 2>/dev/null || echo not')
CC          = gcc
LD          = gcc
CFLAGS      = -std=c11 -O2 -Wall -Wextra -Wno-unused-parameter -Wno-unused-function -Wno-unused-result -pedantic -g
BIN_DIR    = bin
SRC_DIR    = src
BLD_DIR    = build
SRC        = $(wildcard $(SRC_DIR)/*.c)
OBJ        = $(patsubst $(SRC_DIR)/%.c,$(BLD_DIR)/%.o,$(SRC))
DEPS       = $(patsubst $(BLD_DIR)/%.o,$(BLD_DIR)/%.d,$(OBJ))
PROGRAM    = guide2

vpath %.c $(SRC_DIR)

.DEFAULT_GOAL = build

.PHONY: run fmt lint leak-check doc checkdirs all clean

$(BLD_DIR)/%.d: %.c
	$(CC) -M $(CFLAGS) $(INCLUDES) $< -o $@

$(BLD_DIR)/%.o: %.c
	$(CC) -c $(CFLAGS) $(INCLUDES) $< -o $@

$(BIN_DIR)/$(PROGRAM): $(DEPS) $(OBJ)
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ $(OBJ)

build: checkdirs $(BIN_DIR)/$(PROGRAM)

run: build
	@./$(BIN_DIR)/$(PROGRAM)

fmt:
	@echo "C and Headers files:"
	@-clang-format -verbose -style="{BasedOnStyle: Google, IndentWidth: 4}" -i $(SRC_DIR)/*.c $(SRC_DIR)/*.h
	@echo "Shell files:"
	@-shfmt -l -s -w -i 2 .

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

clean:
	@echo "Cleaning..."
	@echo ""
	@-rm -rd $(BLD_DIR)/* $(BIN_DIR)/*
	@echo ""
	@echo "...✓ done!"
