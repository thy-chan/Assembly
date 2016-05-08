stack segment stack
	dw 256 dup(?)
stack ends
data segment
	a db 10h
	b db 30h
data ends
code segment
assume cs:code,ss:stack,ds:data
start:	mov ax,data
	mov ds,ax
	mov a,al
	mov b,al
	cmp a,al
	jge agb
	mov dl,'b'
	mov bl,'a'
	jmp disp
agb:	mov dl,'a'
	mov bl,'b'
disp:	mov ah,2
	int 21h
	mov dl,'>'
	int 21h
	mov dl,bl
	int 21h
	mov ah,4ch
	int 21h
code ends
end start