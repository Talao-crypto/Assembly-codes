TITLE ATIV2_2
.model small
.stack 100h
.data
    msg1 db 10,13,'Digite um primeiro numero (0-9): $'
    msg2 db 10,13,'Digite um segundo numero (0-9): $'
    msg_resultado db 10,13,'A soma dos dois numeros eh: $'
     msg_erro db 10,13,'Erro: A soma ultrapassa 9. Por favor, reinicie o programa e digite numeros validos.$'
.code

main proc
    mov ax, @data  ; Inicializa o segmento de dados
    mov ds, ax

    ; Exibe a primeira mensagem e recebe o primeiro número
    mov ah, 9
    lea dx, msg1
    int 21h

    mov ah, 1
    int 21h
    sub al, 48     ; Converte de ASCII para valor numérico (0-9)
    mov bl, al     ; Armazena o primeiro número em BL

    ; Exibe a segunda mensagem e recebe o segundo número
    mov ah, 9
    lea dx, msg2
    int 21h

    mov ah, 1
    int 21h
    sub al, 48     ; Converte de ASCII para valor numérico (0-9)

    ; Soma os dois números
    add bl, al     ; BL = primeiro número, AL = segundo número

    ; Verifica se a soma ultrapassa 9
    cmp bl, 9      ; Compara a soma com 9
    jg erro        ; Se a soma for maior que 9, pula para a mensagem de erro

    ; Converte o resultado de volta para ASCII
    add bl, 48     ; Converte de valor numérico para ASCII
    

    ; Exibe a mensagem de resultado
    mov ah, 9
    lea dx, msg_resultado
    int 21h

    ; Exibe o resultado da soma
    mov dl, bl     ; Resultado em BL (agora está em ASCII)
    mov ah, 2      ; Função para exibir caractere
    int 21h

    ; Finaliza o programa
    mov ah, 4Ch    ; Função para terminar o programa
    int 21h

    erro:
    ; Exibe a mensagem de erro
    mov ah, 9
    lea dx, msg_erro
    int 21h

    ; Finaliza o programa após erro
    mov ah, 4Ch    ; Função para terminar o programa
    int 21h

main endp
end main
