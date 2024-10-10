Title Mensagem
.model small
.data
    texto1 db 'Ola, mundo!',  13,10, '$'
    texto2 db 'Meu primeiro codigo', '$'
.code
main proc

    mov ax,@data
    mov ds,ax

    mov dx,offset texto1
    mov ah,9
    int 21h
    mov dx,offset texto2
    int 21h

    mov ah,4ch
    int 21h
main endp
end main
    