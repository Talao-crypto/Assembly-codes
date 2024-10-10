TITLE ExibirLetras
.MODEL SMALL
.STACK 100h

.DATA
nova_linha db 13, 10, '$'  ; Código para nova linha (CR + LF)

.CODE
PRINCIPAL PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Exibir letras maiúsculas de 'A' a 'Z'
    MOV CX, 26        ; Contador para 26 letras
    MOV DL, 'A'       ; Inicia com a letra 'A'
maiusculas:
    MOV AH, 2         ; Função para exibir caractere
    INT 21h           ; Exibir a letra atual
    INC DL            ; Incrementar para a próxima letra
    LOOP maiusculas   ; Repetir até CX = 0

    ; Exibir nova linha
    MOV AH, 9
    LEA DX, nova_linha
    INT 21h

    ; Exibir letras minúsculas de 'a' a 'z'
    MOV CX, 26        ; Contador para 26 letras
    MOV DL, 'a'       ; Inicia com a letra 'a'
minusculas:
    MOV AH, 2         ; Função para exibir caractere
    INT 21h           ; Exibir a letra atual
    INC DL            ; Incrementar para a próxima letra
    LOOP minusculas   ; Repetir até CX = 0

    ; Finalizar programa
    MOV AH, 4Ch
    INT 21h

PRINCIPAL ENDP
END PRINCIPAL
