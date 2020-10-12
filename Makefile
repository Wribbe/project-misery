ARCH := linux

DIR_SRC := src
DIR_BIN := bin_${ARCH}
DIR_LIB := lib_${ARCH}

BINS := $(foreach f,$(wildcard ${DIR_SRC}/*.c),${DIR_BIN}/$(notdir $(f:%.c=%)))

FLAGS := -Wall -g -pedantic -Iinclude


FLAGS_linux := ${FLAGS}
CC_linux := gcc


FLAGS_windows:= ${FLAGS}
CC_windows := x86_64-w64-mingw32-gcc


DEPS := Makefile $(wildcard ${DIR_LIB}/*.c) $(wildcard include/*.h)


all: ${BINS}


${DIR_BIN}/% : ${DIR_SRC}/%.c ${DEPS} | ${DIR_BIN}
	${CC_${ARCH}} $(filter %.c %.h,$^) -o $@ ${FLAGS_${ARCH}}


${DIR_BIN} :
	mkdir $@
