##################################################################################
# Makefile - Configuration file for GNU make (http://www.gnu.org/software/make/)
# Time-stamp: <Mer 2014-09-24 17:18 svarrette>
#
# Copyright (c) 2014 Sebastien Varrette <Sebastien.Varrette@uni.lu>
#
############################## Variables Declarations ############################
SNIPPETS_SOURCES = $(shell find . -name '*.el')
SNIPPETS_TARGET  = $(patsubst %.el,%.elc, $(SNIPPETS_SOURCES))

all:
	$(MAKE) -C .. snippets

%.elc: %.el
	@echo -e "$(COLOR_GREEN)==> Byte compiling YAS Snippets '$<' to generate $@$(NO_COLOR)"
	$(EMACS_BATCH) -f batch-byte-compile $<

clean:
	rm -f $(SNIPPETS_TARGET)
