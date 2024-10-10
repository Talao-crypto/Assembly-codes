TITLE atividade2
.model small

.data
    txt1 db 13,10,'Digite uma letra minuscula:  $'
    txt2 db 13,10,'A letra maiuscula correspondente eh:  $'
    letra db ? ;variavel para armazenar a letra digitada
.code

main proc 

    mov ax,@data
    mov ds,ax

    mov ah,9
    lea dx,txt1
    int 21h

    mov ah,1
    int 21h
    mov letra,al ;armazena a letra digitada

    cmp letra, 'a'
    
    cmp letra, 'z'
    

    sub letra, 32 ;converte para maiuscula subtraindo 32 pois se subtrair 32 de qualquer minuscula vai dar sua vertente maiuscula ex: a=97 97-32=65 65=A

    mov ah,9
    lea dx,txt2
    int 21h

    mov dl,letra ;joga a variavel maiuscula dentro de dl
    mov ah,2 ;essa função mostra um caracter, e o caracter esperado é o de DL
    int 21h

    mov ah,4ch
    int 21h

main endp
end main