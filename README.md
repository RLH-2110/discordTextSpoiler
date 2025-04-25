# discordTextSpoiler

This is a quick 32 bit console program for Windows to format text, so every letter is in a spoiler.  
Example: `Test` -> `||T||||e||||s||||t||`

# Assembling and linking

you need nasm, and a Windows version of gcc, having make is also good.  
If you don't have make, just run these commands:
`nasm -f win32 spoil.asm`  
`gcc -m32 spoil.obj -o spoil.exe -lmsvcrt`  

if you have make, you can just run `make`
there are these PHONY targets: all, clean, run
