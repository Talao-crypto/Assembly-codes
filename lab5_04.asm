TITLE ExibirLetras4PorLinha
.MODEL SMALL
.STACK 100h

.DATA
nova_linha db 13, 10, '$'  ; Código para nova linha (carriage return + line feed)

.CODE
PRINCIPAL PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 26        ; Contador para 26 letras (de 'a' a 'z')
    MOV DL, 'a'       ; Inicia com a letra 'a'

exibir_letras:
    ; Exibe 4 letras por linha
    MOV AH, 2         ; Função para exibir caractere
    INT 21h           ; Exibe a letra atual
    INC DL            ; Próxima letra
    LOOP linha_letras ; Reduz CX até chegar a 0, continua o loop

    ; Nova linha após cada conjunto de 4 letras
    MOV AH, 9         ; Função para exibir string
    LEA DX, nova_linha ; Exibir nova linha (CR + LF)
    INT 21h

linha_letras:
    ; Loop para exibir 4 letras por linha
    MOV CX, 4         ; Define para exibir 4 letras por linha
    LOOP exibir_letras

    ; Finalizar programa
    MOV AH, 4Ch
    INT 21h

PRINCIPAL ENDP
END PRINCIPAL
