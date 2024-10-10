TITLE classe1
.MODEL small
.STACK 100h

.DATA
    msg1 db 13,10, "Digite A:  $"
    msg2 db 13,10, "Digite B:  $"
    msg3 db 13,10, "O maior e:  $"

.CODE

main PROC

    mov ax, @data
    mov ds, ax

    ; Exibe mensagem para digitar A
    mov ah, 9
    lea dx, msg1
    int 21h

    ; Lê o valor de A
    mov ah, 1
    int 21h
    mov bl, al      ; Armazena A em BL

    ; Exibe mensagem para digitar B
    mov ah, 9
    lea dx, msg2
    int 21h

    ; Lê o valor de B
    mov ah, 1
    int 21h

    ; Comparar A (BL) com B (AL)
    cmp al, bl
    jb escrever_BL   ; Se A (BL) é maior, pula para escrever_BL

    ; Se B for maior ou igual, exibe B
    mov ah, 9
    lea dx, msg3
    int 21h

    mov dl, al      ; DL recebe o valor de B
    mov ah, 2       ; Função para exibir o caractere
    int 21h
    jmp fim         ; Pula para o final

escrever_BL:
    ; Se A for maior, exibe A
    mov ah, 9
    lea dx, msg3
    int 21h

    mov dl, bl      ; DL recebe o valor de A (BL)
    mov ah, 2       ; Função para exibir o caractere
    int 21h

fim:
    ; Finaliza o programa
    mov ah, 4Ch
    int 21h

main ENDP
END main
