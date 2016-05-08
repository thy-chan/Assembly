stack segment stack
	dw 256 dup(?)
stack ends
code segment
	assume cs:code,ss:stack
start:	mov ah,1
	int 21h
	mov bl,al

	mov dl,20h
	mov ah,2
	int 21h

	mov ah,1
	int 21h
	mov bh,al
	mov dl,0ah
	mov ah,02h
	int 21h
	cmp bl,bh
	ja s
	jmp agb
agb:	mov al,bh
	mov bh,bl
	mov bl,al
s:	mov dl,bl
	mov ah,2
	int 21h
	mov dl,'>'
	int 21h
	mov dl,bh
	int 21h
	mov ah,4ch
	int 21h
code ends
end start