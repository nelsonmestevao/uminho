CC       = gcc
LD       = gcc
CFLAGS   = -O2 -Wall -Wextra -Wno-unused-parameter -Wno-unused-function -Wno-unused-result -pedantic -g
BIN_DIR  = bin
BLD_DIR  = build
DOC_DIR  = docs
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

.PHONY: build run fmt lint check doc test checkdirs clean

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

check: LOG = $(LOG_DIR)/`date +%Y-%m-%d_%H:%M:%S`
check: build
	@memusage --data=$(LOG).dat --png=$(LOG).png $(BIN_DIR)/$(PROGRAM)
	@valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all \
		--log-file=$(LOG).log ./$(BIN_DIR)/$(PROGRAM)

doc:
	@doxygen $(DOC_DIR)/Doxyfile

test:
	@echo "Write some tests!"

checkdirs:
	@mkdir -p $(BIN_DIR)
	@mkdir -p $(BLD_DIR)
	@mkdir -p $(DOC_DIR)
	@mkdir -p $(LOG_DIR)
	@mkdir -p $(OUT_DIR)

clean:
	@echo "Cleaning..."
	@echo ""
	@cat .art/maid.ascii
	@-rm -rd $(BLD_DIR)/* $(BIN_DIR)/* $(OUT_DIR)/* $(LOG_DIR)/* \
		$(DOC_DIR)/html $(DOC_DIR)/latex
	@echo ""
	@echo "...✓ done!"

