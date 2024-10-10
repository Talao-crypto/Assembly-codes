title numeros
.model small
.code
main proc
    mov cx,10
    mov dl,30h
    mov ah,2
    imprime:
    int 21h
    mov bl,dl
    mov dl,10
    int 21h
    mov dl,bl
    inc dl
    loop imprime
    mov ah,4ch
    int 21h

main endp
end main

