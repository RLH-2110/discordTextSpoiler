nasm=nasm
gcc=gcc

spoil.exe: spoil.obj
	$(gcc) -m32 spoil.obj -o spoil.exe -lmsvcrt

spoil.obj: spoil.asm
	$(nasm) -f win32 spoil.asm
	
all: spoil.exe

clean:
	del *.obj
	del spoil.exe

run: spoil.exe
	spoil.exe

.PHONY: all clean run debug
