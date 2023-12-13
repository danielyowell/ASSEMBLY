# Makefile for x86 assembly program

ASM_SOURCE = hello.asm
OBJ_FILE = hello.o
EXE_FILE = hello.x

#all: 

.PHONY: all clean

all: $(EXE_FILE) clean

$(EXE_FILE): $(OBJ_FILE)
	@ld -m elf_i386 -s -o $(EXE_FILE) $(OBJ_FILE)
	@./$(EXE_FILE)

$(OBJ_FILE): $(ASM_SOURCE)
	@nasm -f elf $(ASM_SOURCE)

#clean:
#	rm -f $(OBJ_FILE) $(EXE_FILE)
clean:
	@rm -f *~ *.x *.o
	@rm -f *~ *.x *.o

######

#CC=gcc
#CFLAGS= -std=c99 -g -O2 -fopenmp

# run-local: build-local
# 	./run-hw.x

# run-valgrind-local: build-local
# 	valgrind ./run-hw.x

# build-local: hw_code.c sparse.c
# 	${CC} ${CFLAGS} -c  helper.c
# 	${CC} ${CFLAGS} -c  hw_code.c
# 	${CC} ${CFLAGS} -c  sparse.c
# 	${CC} ${CFLAGS} hw_code.o sparse.o helper.o -o ./run-hw.x

