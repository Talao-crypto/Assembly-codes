.model small
.stack 100h
.data
    msg1 db 'Digite caracteres (termina com Enter): $'
    cr db 13   ; Carriage Return (Enter)
    asterisco db '*$'
    contagem db 0  ; Para contar o número de caracteres
.code 
main proc
mov ax,@data
mov ds,ax

mov ah,9
lea dx,msg1
int 21h

leitura:

mov ah,1
int 21h
cmp al, cr
je imprimir 

inc contagem
jmp leitura

imprimir:
mov cl, contagem

imprimir_asterisco:
cmp cl, 0
je fim

mov ah,9
lea dx,asterisco
int 21h

dec cl
jmp imprimir_asterisco

fim:
mov ah,4Ch
int 21h


main endp
end main