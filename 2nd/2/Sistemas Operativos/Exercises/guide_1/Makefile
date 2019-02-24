CC         = gcc
CFLAGS     = -std=c11 -O2 -Wall -Wextra -pedantic -g
OBJS       = $(patsubst %.c,%.o,$(wildcard $(SRCDIR)*.c))
SRCDIR     = src/
LIBDIR     = lib/
DOCDIR     = docs/
PROGRAM    = guide1

$(PROGRAM): $(OBJS)
	$(CC) -o $(PROGRAM) $(OBJS)

run:
	@./$(PROGRAM) $(input)

fmt:
	@astyle --style=google -nr *.c,*.h

doc:
	@doxygen $(DOCDIR)/Doxyfile

clean:
	@echo "Cleaning..."
	@echo ""
	@cat .art/maid.ascii
	@rm -rf $(SRCDIR)*.o $(PROGRAM) $(DOCDIR)/html $(DOCDIR)/latex
	@echo ""
	@echo "...✓ done!"
