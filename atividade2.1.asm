TITLE atividade2
.model small
.stack 100h
.data
    txt1 db 10,13,'Digite um primeiro numero:  $' ; Mensagem para solicitar o primeiro número
    txt2 db 10,13,'Digite um segundo numero:  $' ; Mensagem para solicitar o segundo número
    msg_resultado db 10,13,'A soma dos dois eh: $' ; Mensagem para exibir o resultado
.code

main proc

    mov ax,@data  ; Inicializa o segmento de dados
    mov ds,ax

    ; Perguntar pelo primeiro número
    mov ah,9      ; Função para exibir string
    lea dx,txt1   ; Endereço da mensagem
    int 21h       ; Exibe a mensagem

    ; Receber o primeiro número
    mov ah,1      ; Função para ler caractere
    int 21h       ; Lê o caractere
    sub al,48     ; Converte de ASCII para número
    mov bl, al    ; Armazena o número em BL

    ; Perguntar pelo segundo número
    mov ah,9      ; Função para exibir string
    lea dx,txt2   ; Endereço da mensagem
    int 21h       ; Exibe a mensagem

    ; Receber o segundo número
    mov ah,1      ; Função para ler caractere
    int 21h       ; Lê o caractere
    sub al,48     ; Converte de ASCII para número
    add al, bl    ; Soma com o primeiro número

    ; Converter o resultado de volta para ASCII
    add al,48     ; Converte de número para ASCII

    ; Exibir a mensagem de resultado
    mov ah,9      ; Função para exibir string
    lea dx,msg_resultado ; Endereço da mensagem
    int 21h       ; Exibe a mensagem

    ; Exibir o resultado da soma
    mov dl, al    ; Resultado em DL
    mov ah,2      ; Função para exibir caractere
    int 21h       ; Exibe o caractere

    ; Finalizar o programa
    mov ah,4ch    ; Função para terminar o programa
    int 21h       ; Termina a execução

main endp
end main




