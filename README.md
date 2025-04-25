# discordTextSpoiler

This is a quick 32 bit console program for Windows to format text, so every letter is in a spoiler.  
Example: `Test` -> `||T||||e||||s||||t||`

> [!NOTE]
> There is a maximum size for the user input, this project was just a quick non-serious attempt to write a program like this in assembly, so this will not be addressed.

# Usage

just run spoil.exe, you will then be prompted for input, you can then enter 254 characters of text, the program will then format it, so that every letter is in a spoiler tag for discord.

# Assembling and linking

you need nasm, and a Windows version of gcc, having make is also good.  
If you don't have make, just run these commands:
`nasm -f win32 spoil.asm`  
`gcc -m32 spoil.obj -o spoil.exe -lmsvcrt`  

if you have make, you can just run `make`
there are these PHONY targets: all, clean, run
