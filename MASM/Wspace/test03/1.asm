code segment
assume cs:code
g1:
	mov ah,1
	int 21h
	cmp al,'$'
	jz exit
	mov dl,al
	mov ah,2
	int 21h
	jmp g1
exit:
	mov ah,4ch
	int 21h
code ends
end g1