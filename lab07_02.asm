TITLE Multiplicacao por somas sucessivas
.MODEL SMALL
.STACK 100h

.DATA
    msg1 db 13, 10, "Digite o multiplicando: $"
    msg2 db 13, 10, "Digite o multiplicador: $"
    msg3 db 13, 10, "Produto: $"
    
    multiplicando db 0       ; Armazena o multiplicando
    multiplicador db 0       ; Armazena o multiplicador
    produto db 0             ; Armazena o produto da multiplicacao

.CODE
MAIN PROC
    ; Inicializar a segmentação de dados
    MOV AX, @DATA
    MOV DS, AX

    ; Solicitar o multiplicando
    MOV AH, 9                
    LEA DX, msg1             
    INT 21H                  

    MOV AH, 1               
    INT 21H                  ; Interromper para ler o caractere
    SUB AL, '0'              ; Converter de ASCII para número
    MOV multiplicando, AL    ; Armazenar o multiplicando na variável

    ; Solicitar o multiplicador
    MOV AH, 9                ; Função para exibir string
    LEA DX, msg2             ; Carregar a mensagem 2
    INT 21H                  ; Interromper para exibir a mensagem

    MOV AH, 1                ; Função para leitura de caractere
    INT 21H                  ; Interromper para ler o caractere
    SUB AL, '0'              ; Converter de ASCII para número
    MOV multiplicador, AL    ; Armazenar o multiplicador na variável

    ; Inicializar o produto e o contador de somas
    MOV AL, 0                ; Produto inicial é zero
    MOV BL, multiplicando    ; Colocar o multiplicando em BL
    MOV CL, multiplicador    ; Colocar o multiplicador em CL (para controlar o número de somas)

    ; Loop para realizar a soma sucessiva
MULTIPLICACAO:
    CMP CL, 0                ; Verificar se o multiplicador (CL) chegou a zero
    JE FIM                   ; Se CL for zero, fim da multiplicação
    ADD AL, BL               ; Somar o multiplicando ao produto atual
    DEC CL                   ; Decrementar o multiplicador
    JMP MULTIPLICACAO        ; Repetir até que o multiplicador seja zero

FIM:
    ; Armazenar o resultado na variável produto
    MOV produto, AL

    ; Exibir o produto
    MOV AH, 9                ; Função para exibir string
    LEA DX, msg3             ; Carregar a mensagem 3
    INT 21H                  ; Interromper para exibir a mensagem

    ; Verificar se o produto é maior que 9
    CMP produto, 9
    JLE EXIBE_RESULTADO

    ; Se o produto for maior que 9, calcular os dígitos
    MOV AL, produto          ; Colocar o produto em AL
    MOV AH, 0                ; Limpar AH para divisão
    MOV BL, 10               ; Divisor é 10
    DIV BL                   ; Divisão AL/BL -> Quociente em AL, resto em AH

    ADD AL, '0'              ; Converter o quociente para ASCII
    MOV DL, AL               ; Colocar o quociente em DL
    MOV AH, 2                ; Função para exibir caractere
    INT 21H                  ; Exibir o primeiro dígito

    MOV AL, AH               ; Mover o resto para AL
    ADD AL, '0'              ; Converter o resto para ASCII
    MOV DL, AL               ; Colocar o resto em DL
    MOV AH, 2                ; Função para exibir caractere
    INT 21H                  ; Exibir o segundo dígito

    JMP FIM_PROGRAMA

EXIBE_RESULTADO:
    ; Exibir o produto se for um dígito só
    MOV AL, produto          ; Colocar o produto em AL
    ADD AL, '0'              ; Converter o produto para ASCII
    MOV DL, AL               ; Colocar o produto em DL
    MOV AH, 2                ; Função para exibir caractere
    INT 21H                  ; Exibir o produto

FIM_PROGRAMA:
    ; Encerrar o programa
    MOV AH, 4CH              ; Função para terminar o programa
    INT 21H                  ; Interromper para encerrar

MAIN ENDP
END MAIN

