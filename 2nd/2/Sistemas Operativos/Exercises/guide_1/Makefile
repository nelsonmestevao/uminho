CC      = gcc
LD      = gcc
CFLAGS  = -O2 -Wall -Wextra -Wno-unused-parameter -Wno-unused-function -Wno-unused-result -pedantic -g
BIN_DIR = bin
SRC_DIR = src
DOC_DIR = docs
BLD_DIR = build
SRC     = $(wildcard $(SRC_DIR)/*.c)
OBJS    = $(patsubst $(SRC_DIR)/%.c,$(BLD_DIR)/%.o,$(SRC))
DEPS    = $(patsubst $(BLD_DIR)/%.o,$(BLD_DIR)/%.d,$(OBJS))
PROGRAM = guide1

vpath %.c $(SRC_DIR)

.DEFAULT_GOAL = build

.PHONY: build run fmt lint leak-check doc checkdirs clean

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
	@uncrustify -c .uncrustify --no-backup $(SRC_DIR)/*.c $(SRC_DIR)/*.h

lint:
	@splint -retvalint -I $(SRC_DIR)/*.c $(SRC_DIR)/*.h

leak-check: $(BIN_DIR)/$(PROGRAM)
	@valgrind --vgdb=no --tool=memcheck --leak-check=yes ./$(BIN_DIR)/$(PROGRAM) $(input)

doc:
	@doxygen $(DOC_DIR)/Doxyfile

test:
	@cd tests && ./sample_data.sh

checkdirs:
	@mkdir -p $(BLD_DIR)
	@mkdir -p $(BIN_DIR)
	@mkdir -p $(DOC_DIR)

clean:
	@echo "Cleaning..."
	@echo ""
	@-cat .art/maid.ascii
	@-rm -rd $(BLD_DIR)/* $(BIN_DIR)/* $(DOC_DIR)/html $(DOC_DIR)/latex
	@echo ""
	@echo "...✓ done!"
