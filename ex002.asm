tile Mensagem
.model small
.data
    texto1 db 'Ola, mundo!', '$'
    texto2 db 'Meu primeiro codigo', '$'
.code
main proc

    mov ax,@data
    mov ds,ax

    mov dx,offset texto1
    mov ah,9
    int 21h
    mov dx,offset texto2

    mov ah,4ch
    int 21h
main endp
end main
    