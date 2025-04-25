	global _main
	extern _printf
	extern _gets_s
	extern _strlen
	extern _malloc
	extern _free
	extern _putchar
	extern _exit
	
	section .text

_main:

	;print the user prompt
	push message
	call _printf
	add esp, 4 ; stack cleanup
		
	;read in the user input         
	push 255 ;count
	push input_buffer
	
	call  _gets_s
	add esp, 8
	
	push input_buffer
	call _strlen
	
	; get new buffer size
	mov ebx,5
	mul ebx ; eax*5
	inc eax
	
	; allocate buffer
	push eax
	call _malloc
	add esp, 4
	
	; check oom
	cmp eax,0
	jz oom
	
	; init copy thingies
	mov ebx, eax ;  allocated buffer
	mov edx, input_buffer ; input buffer
	
cpy:
	cmp byte [edx], byte 0
	je end
	
	mov [ebx+0], byte '|'
	mov [ebx+1], byte '|'
	mov cl, [edx]
	mov byte [ebx+2], cl
	mov [ebx+3], byte '|'
	mov [ebx+4], byte '|'
	
	add ebx,5
	inc edx
	jmp cpy
	
end:
	mov [ebx], byte 0
	
	;save eax
	push eax
	
	;print the output buffer
	push eax
	call _printf
	add esp, 4

	; free memory
	; we pushed eax earlier
	call _free
	add esp, 4 

	;print newline
	push 0x0D
	call _putchar
	push 0x0A
	call _putchar


	; exit progamm
	push 0
	call _exit

oom:
	push out_of_mem
	call _printf
	add esp, 4
	
	; exit with error 1
	push 1
	call _exit

err:
	push error
	call _printf
	add esp, 4
	
	; exit with error 1
	push 1
	call _exit

	section .data
message:	
	db	"Input string:", 0
out_of_mem:
	db	"out of mem, or programmer messed up" ,0
error:
	db	"an error occured" ,0

	section .bss
input_buffer:
	resb  256 ; orignally it was 255, but one more byte cant hurt, and maybe it saves my ass