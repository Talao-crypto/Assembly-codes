.MODEL SMALL
.STACK 100h

.DATA
    msg1 DB 'Digite os caracteres (pressione Enter para finalizar): $'
    msg2 DB 0Dh,0Ah, 'Numero de caracteres digitados: $'
    asterisco DB '*$'  ; Para exibir o asterisco

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX  ; Inicializa o segmento de dados

    ; Exibe a mensagem inicial
    MOV AH, 9
    LEA DX, msg1
    INT 21h

    ; Inicializa contador de caracteres
    MOV CX, 0  ; CX vai contar os caracteres

LER_CARACTERES:
    ; Lê um caractere do teclado
    MOV AH, 1
    INT 21h

    ; Verifica se é Carriage Return (Enter)
    CMP AL, 0Dh  ; 0Dh é o valor ASCII de CR (Carriage Return)
    JE IMPRIME_ASTERISCOS  ; Se for CR, vai para a parte de impressão

    ; Se não for CR, incrementa o contador
    INC CX
    JMP LER_CARACTERES  ; Continua lendo caracteres

IMPRIME_ASTERISCOS:
    ; Exibe a mensagem de número de caracteres digitados
    MOV AH, 9
    LEA DX, msg2
    INT 21h

    ; Exibe tantos '*' quantos caracteres foram digitados
    MOV BX, CX  ; Armazena o valor de CX (número de caracteres) em BX
EXIBE:
    CMP BX, 0
    JE FIM_EXIBE  ; Se BX for 0, termina a exibição

    ; Exibe um asterisco
    MOV AH, 9
    LEA DX, asterisco
    INT 21h

    DEC BX  ; Decrementa o contador
    JMP EXIBE  ; Volta para exibir o próximo asterisco

FIM_EXIBE:
    ; Termina o programa
    MOV AH, 4Ch
    INT 21h

MAIN ENDP
END MAIN

;Essência: Ambos os programas realizam a mesma tarefa básica.
;Possível Foco Diferente: A ATIVIDADE pode exigir maior ênfase em certas técnicas de implementação ou em conformidade com um estilo específico de programação em Assembly.
;Requisitos: A descrição da ATIVIDADE pode incluir detalhes específicos sobre como o código deve ser ;estruturado ou otimizado (por exemplo, uso de CX como contador ou loop