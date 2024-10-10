TITLE Somatória de 5 números
.model small

.data
    msgEntrada db 13,10, 'Digite um numero de 0 a 9: $'
    msgErro db 13,10, 'Erro: A soma ultrapassou 9! $'
    msgSoma db 13,10, 'A soma dos numeros é: $'
    soma db 0

.code

main proc
    mov ax, @data
    mov ds, ax

    mov cx, 5        ; Definindo contador para 5 números
    xor bl, bl       ; BL irá armazenar a somatória

ler_numeros:
    ; Exibe a mensagem para digitar um número
    mov ah, 9
    lea dx, msgEntrada
    int 21h

    ; Lê o número do teclado
    mov ah, 1
    int 21h
    sub al, '0'      ; Converte o caractere ASCII para valor numérico (0-9)
    add bl, al       ; Soma o número lido em BL

    ; Verifica se a soma ultrapassa 9
    cmp bl, 9
    jg erro_soma     ; Se BL > 9, pula para mensagem de erro

    loop ler_numeros ; Continua até ler 5 números

    ; Exibe a mensagem da soma
    mov ah, 9
    lea dx, msgSoma
    int 21h

    ; Converte a soma para caractere e exibe
    add bl, '0'
    mov dl, bl
    mov ah, 2
    int 21h

    ; Finaliza o programa
    mov ah, 4Ch
    int 21h

erro_soma:
    ; Exibe mensagem de erro caso a soma ultrapasse 9
    mov ah, 9
    lea dx, msgErro
    int 21h

    ; Finaliza o programa
    mov ah, 4Ch
    int 21h

main endp
end main
