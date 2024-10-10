TITLE Lab05_02
.MODEL SMALL
.STACK 100h

.DATA
asterisco db '*'
nova_linha db 13, 10, '$'  ; Código de nova linha (carriage return + line feed)

.CODE
PRINCIPAL PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Exibir 50 asteriscos na mesma linha
    MOV CX, 50         ; Coloca 50 no contador CX
linha_unica:
    MOV AH, 2          ; Função para exibir caractere
    MOV DL, asterisco  ; Caractere '*'
    INT 21h            ; Interrupção para exibir caractere
    LOOP linha_unica   ; Decrementa CX e repete até CX = 0

    ; Exibir nova linha
    MOV AH, 9          ; Função para exibir string
    LEA DX, nova_linha ; Exibir nova linha (CR + LF)
    INT 21h

    ; Exibir 50 asteriscos, um em cada linha
    MOV CX, 50         ; Coloca 50 no contador CX
uma_por_linha:
    MOV AH, 2          ; Função para exibir caractere
    MOV DL, asterisco  ; Caractere '*'
    INT 21h            ; Exibir '*'
    
    MOV AH, 9          ; Função para exibir string
    LEA DX, nova_linha ; Exibir nova linha (CR + LF)
    INT 21h

    LOOP uma_por_linha ; Decrementa CX e repete até CX = 0

    ; Finalizar programa
    MOV AH, 4Ch
    INT 21h

PRINCIPAL ENDP
END PRINCIPAL
