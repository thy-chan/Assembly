data segment
	buf db 'Hello',13,10,'end$'
data ends
stack segment 
	db 100 dup (0)
stack ends
code segment
assume cs:code,ds:data,ss:stack
begin:	mov ax,data
	mov ds,ax
	lea bx,buf
la:	mov dl,[bx]
	cmp dl,'$'
	jz exit
	cmp dl,'a'
	jb k
	cmp dl,'z'
	ja k
	sub dl,20h
k:	mov ah,2
	int 21h
	inc bx
	jmp la
exit:	mov ah,4ch
	int 21h
code ends
end begin	