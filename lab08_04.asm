.model small
.stack 100h
.data
    msg1 db 13, 10, 'Digite um numero decimal (0-9): $'
    msg2 db 13, 10, 'Numero em hexadecimal: $'
    msg3 db 13, 10, "Numero maior que 9, sera ajustado para '1' seguido do numero digitado: $"
.code
main proc
   
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, msg1
    int 21h

    mov ah, 1
    int 21h
    sub al, '0'       
    mov bl, al        

    mov ah, 9
    lea dx, msg2
    int 21h

    cmp bl, 9         
    jle print_decimal 

    ; Caso o número seja maior que 9, gambiarra para adicionar '1' antes
    mov ah, 9
    lea dx, msg3
    int 21h

    mov dl, '1'       ; Exibe '1' primeiro
    mov ah, 2
    int 21h

    mov dl, bl        ; Exibe o número digitado após o '1'
    add dl, '0'
    mov ah, 2
    int 21h

    jmp fim

print_decimal:
    add bl, '0'       
    mov dl, bl        
    mov ah, 2         
    int 21h

fim:
    mov ah, 4Ch
    int 21h

main endp
end main
