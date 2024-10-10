TITLE teste2
.MODEL SMALL
.STACK 100h

.DATA
    msg1 db 13,10, 'Enter a number: $'        ; Mensagem para o número
    msg2 db 13,10, 'Enter a multiplier: $'    ; Mensagem para o multiplicador
    msg3 db 13,10, 'Result: $'                ; Mensagem para o resultado
    number db 0                               ; Variável para armazenar o número
    multiplier db 0                           ; Variável para armazenar o multiplicador
    result db 0                               ; Variável para armazenar o resultado

.CODE
main PROC
    ; Inicializar a segmentação de dados
    MOV AX, @DATA
    MOV DS, AX

    ; Solicitar o número (multiplicando)
    MOV AH, 9            ; Função para exibir string
    LEA DX, msg1         ; Carregar a mensagem 1
    INT 21H              ; Interromper para exibir a mensagem

    MOV AH, 1            ; Função para leitura de caractere
    INT 21H              ; Ler o caractere do usuário
    SUB AL, '0'          ; Converter de ASCII para número
    MOV number, AL       ; Armazenar o número (multiplicando)

    ; Solicitar o multiplicador
    MOV AH, 9            ; Função para exibir string
    LEA DX, msg2         ; Carregar a mensagem 2
    INT 21H              ; Interromper para exibir a mensagem

    MOV AH, 1            ; Função para leitura de caractere
    INT 21H              ; Ler o caractere do usuário
    SUB AL, '0'          ; Converter de ASCII para número
    MOV multiplier, AL   ; Armazenar o multiplicador

    ; Inicializar o resultado como 0
    MOV AL, 0
    MOV result, AL

    ; Multiplicação por somas sucessivas
    MOV CL, multiplier   ; Carregar o multiplicador em CL para usar como contador
    MOV BL, number       ; Colocar o multiplicando em BL

multiplicacao:
    CMP CL, 0            ; Verificar se o contador chegou a 0
    JE fim               ; Se o contador for 0, sair do loop
    ADD result, BL       ; Somar o multiplicando ao resultado
    DEC CL               ; Decrementar o contador
    JMP multiplicacao    ; Repetir o processo até CL ser 0

fim:
    ; Exibir o resultado
    MOV AH, 9            ; Função para exibir string
    LEA DX, msg3         ; Carregar a mensagem 3
    INT 21H              ; Interromper para exibir a mensagem

    MOV AL, result       ; Colocar o resultado em AL
    ADD AL, '0'          ; Converter de número para ASCII
    MOV DL, AL           ; Colocar o caractere resultante em DL
    MOV AH, 2            ; Função para exibir caractere
    INT 21H              ; Interromper para exibir o resultado

    ; Encerrar o programa
    MOV AH, 4Ch          ; Função para terminar o programa
    INT 21h              ; Interromper para encerrar

main ENDP
END main

