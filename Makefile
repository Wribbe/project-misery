ARCH := linux

DIR_SRC := src
DIR_BIN := ${ARCH}_bin
DIR_LIB := ${ARCH}_lib
DIR_BUILD := ${ARCH}_build


BINS_linux := \
	$(foreach f,$(wildcard ${DIR_SRC}/*.c),${DIR_BIN}/$(notdir $(f:%.c=%)))

BINS_windows := $(foreach f,${BINS_linux},$f.exe)


GLFW_FLAGS = $(shell pkg-config ${DIR_BUILD}/glfw/src/glfw3.pc --static --libs)

FLAGS = -Wall -g -pedantic $(filter-out -lglfw3,${GLFW_FLAGS})

INCLUDES := -Iinclude -I${DIR_LIB} \
	-Iglfw/include \
	-I${DIR_BUILD}/glad/include \


FLAGS_linux := ${FLAGS}
CC_linux := gcc
CMAKE_OPTS_linux :=


FLAGS_windows:= ${FLAGS}
CC_windows := x86_64-w64-mingw32-gcc
CMAKE_OPTS_windows := -DCMAKE_TOOLCHAIN_FILE=../../glfw/CMake/x86_64-w64-mingw32.cmake


DEPS := \
	Makefile \
  $(wildcard ${DIR_LIB}/*) \
	$(wildcard include/*) \
	${DIR_BUILD}/glfw/src/libglfw3.a \
	${DIR_BUILD}/glad/libglad.a


all: ${BINS_${ARCH}}


${DIR_BIN}/% : ${DIR_SRC}/%.c ${DEPS} | ${DIR_BIN}
	${CC_${ARCH}} $(filter %.c %.a,$^) -o $@ ${INCLUDES} ${FLAGS_${ARCH}}


${DIR_BIN} ${DIR_BUILD}:
	mkdir $@


${DIR_BUILD}/glfw/src/libglfw3.a : | glfw
	cd glfw && git checkout latest
	-mkdir ${DIR_BUILD}/glfw
	cd ${DIR_BUILD}/glfw && cmake ${CMAKE_OPTS_${ARCH}} ../../glfw && make


${DIR_BUILD}/glad/libglad.a : | glad
	cd glad && git checkout v0.1.33
	-mkdir ${DIR_BUILD}/glad
	cd ${DIR_BUILD}/glad && cmake ${CMAKE_OPTS_${ARCH}} ../../glad && make


glfw: | ${DIR_BUILD}
	git clone https://github.com/glfw/glfw glfw


glad : | ${DIR_BUILD}
	git clone https://github.com/Dav1dde/glad
