CC       = gcc
LD       = gcc
CFLAGS   = -O2 -Wall -Wextra -Wno-unused-parameter -Wno-unused-function -Wno-unused-result -pedantic -g
BIN_DIR  = bin
BLD_DIR  = build
LOG_DIR  = log
OUT_DIR  = out
SRC_DIR  = src
TST_DIR  = tests
SRCS     = $(wildcard $(SRC_DIR)/*.c)
OBJS     = $(patsubst $(SRC_DIR)/%.c,$(BLD_DIR)/%.o,$(SRCS))
DEPS     = $(patsubst $(BLD_DIR)/%.o,$(BLD_DIR)/%.d,$(OBJS))
PROGRAMS = $(addprefix $(BIN_DIR)/, $(notdir $(OBJS:.o=)))

vpath %.c $(SRC_DIR)

.DEFAULT_GOAL = build

.PHONY: build run fmt lint test checkdirs clean

$(BLD_DIR)/%.d: %.c
	$(CC) -M $(CFLAGS) $(INCLUDES) $< -o $@

$(BLD_DIR)/%.o: %.c
	$(CC) -c $(CFLAGS) $(INCLUDES) $< -o $@

$(BIN_DIR)/%: $(BLD_DIR)/%.o
	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@
	@echo ""

build: checkdirs $(PROGRAMS)

run: build

fmt:
	@echo "C and Headers files:"
	@-clang-format -style="{BasedOnStyle: Google, IndentWidth: 4}" -verbose -i $(SRC_DIR)/*.c $(SRC_DIR)/*.h
	@echo "Shell files:"
	@shfmt -l -w -i 2 .

lint:
	@splint -retvalint -hints -I $(SRC_DIR)/*.c

test:
	@echo "Write some tests!"

checkdirs:
	@mkdir -p $(BIN_DIR)
	@mkdir -p $(BLD_DIR)
	@mkdir -p $(LOG_DIR)
	@mkdir -p $(OUT_DIR)

clean:
	@echo "Cleaning..."
	@echo ""
	@-rm -rd $(BLD_DIR)/* $(BIN_DIR)/* $(OUT_DIR)/* $(LOG_DIR)/*
	@echo ""
	@echo "...✓ done!"

