stack segment stack
	db 100 dup(?)
stack ends
data segment
 buff db 16 dup(20h),'$'
 result	dw 0							;保存转换后的二进制数
 mes1 db 0dh,0ah						;回车换行
     db 'Please enter a decimal number between 0~9999:$'	
 mes2 db 0dh,0ah						;回车换行
     db 'It corresponds to the binary number is:','$'
data ends
code segment
	assume cs:code,ds:data,ss:stack
start:	mov ax,data					;将数据段的段地址data送入ax中
	mov ds,ax					;将ax的值送入ds中
        lea dx,mes1					;取mes1的偏移地址,存入dx中
	mov ah,9
	int 21h
	lea si,result
	call input				;把输入的结果转换后送Result单元
	lea dx,mes2                           	;显示输出提示信息
	mov ah,09h
	int 21h

	mov bx,result
	lea si,buff
	call output                            	;把Result中的数转换成要显示的ASCII码 
	mov ah,09h
	lea dx,buff				;把结果输出到显示器上
	int 21h
	mov ax,4c00h
	int 21h
input:
	mov ah,01h				;键盘输入并回显
	int 21h
	cmp al,0dh                            	;如果输入的不是回车则继续输入，否则输入结束
	jz endret
	mov ah,0
	sub al,30h                  		;这里没有判错功能，假定输入的就是0～9的数字，所以直接减30H
	push ax                                	;保护AX，此时AH要清0
	mov ax,[si]                            	;转换算法：result＝result*10＋AX
	mov bx,10			       	;将10送入bx中
	mul bx				       	;al*bx 
	mov [si],ax
	pop ax
	add [si],ax
	jmp input
endret:
	ret
output:
 	mov cx,16
s0:
	mov dl,30h
	rol bx,1		;bx循环左移1位,
	adc dl,0		;带进位加法指令
	mov [si],dl
	inc si			;si自增
	loop s0
	ret
	
code ends
end start

