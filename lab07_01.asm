TITLE lab7
.MODEL SMALL
.DATA

msg1 db 13,10,"Digite o numero: $"
msg2 db 13,10,"Digite o divisor:  $"
msg3 db 13,10,"Quociente: $"
msg4 db 13,10,"Resto: $"

.CODE
main proc
    mov ax, @data
    mov ds, ax

    ; Solicitar o número (dividendo)
    mov ah, 9
    lea dx, msg1
    int 21h

    mov ah, 1
    int 21h
    sub al, '0'    ; Converter de ASCII para valor numérico
    mov bl, al     ; Armazenar o dividendo em BL

    ; Solicitar o divisor
    mov ah, 9
    lea dx, msg2
    int 21h

    mov ah, 1
    int 21h
    sub al, '0'    ; Converter de ASCII para valor numérico
    mov bh, al     ; Armazenar o divisor em BH

    ; Inicializar os registros para divisão
    mov cl, 0      ; Armazenar o quociente
    mov dl, bl     ; Armazenar o resto (inicialmente o dividendo)

divisao:
    cmp dl, bh     ; Comparar o resto (DL) com o divisor (BH)
    jl fim_divisao ; Se o resto for menor que o divisor, sair do loop
    sub dl, bh     ; Subtrair o divisor do resto
    inc cl         ; Incrementar o quociente
    jmp divisao

fim_divisao:
    ; Exibir o quociente
    mov ah, 9
    lea dx, msg3
    int 21h

    add cl, '0'    ; Converter o quociente para ASCII
    mov dl, cl
    mov ah, 2      ; Exibir o quociente
    int 21h

    ; Exibir o resto
    mov ah, 9
    lea dx, msg4
    int 21h

    add dl, '0'    ; Converter o resto para ASCII
    mov ah, 2      ; Exibir o resto
    int 21h

    ; Encerrar o programa
    mov ah, 4Ch
    int 21h

main endp
END main
