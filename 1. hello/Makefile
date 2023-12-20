########################################################
# This is a Makefile for the "hello world" x86 program.
# You don't have to understand the Makefile right now, 
# but it helps if you want to modify or debug your code.
#
# If you've never seen a Makefile before, it's basically
# a way to run several commands/files at once to compile
# your program with a single terminal command -- "make".
# For our purposes, this is essentially a bash script.
########################################################

# These variables serve as nicknames for our files.
# hello.asm is the important one--the one we're writing.
# Try swapping "hello" with "hello2".
NAME = hello2
ASM_SOURCE = $(NAME).asm
OBJ_FILE = $(NAME).o
EXE_FILE = $(NAME).x


# This is the root of our Makefile.
# - When we call "make" in the terminal, this is the first line that gets run.
# - Try deleting "clean" and then call "make". What happens in the "hello" directory?
all: $(EXE_FILE) clean

# When you call "make", each command is "echo"ed in the terminal by default.
# Try adding "@" to the start of ./$(EXE_FILE). What happens?
$(EXE_FILE): $(OBJ_FILE)
	@ld -m elf_i386 -s -o $(EXE_FILE) $(OBJ_FILE) 
	@./$(EXE_FILE)

$(OBJ_FILE): $(ASM_SOURCE)
	@nasm -f elf $(ASM_SOURCE)

# This is our "clean" function. It's very simple:
# rm  = "remove"
# -f  = "force" (without asking me first)
# *~  = "all temp files" (we don't have any here, but this is good practice)
# *.x = "all files ending with .x"
# *.o = "all files ending with .o"
clean:
	@rm -f *~ *.x *.o
