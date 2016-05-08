stack segment stack
	db 64 dup(?)
stack ends
data segment
buff 	db 50,?,50 dup(?)
mes1 	db 0dh,0ah
	db 'What is your name?:$'
mes2	db 0dh,0ah
	db 'hello!','$'
data ends
code segment
	assume cs:code,ds:data,ss:stack
start:	mov ax,data
	mov ds,ax
        mov dx,offset mes1
        mov ah,9
        int 21h
        mov dx,offset buff
        mov ah,0ah
        int 21h
        mov dx,offset mes2
        mov ah,9
        int 21h
        mov ah,4ch
        int 21h
code ends
end start
