.MODEl small ;Define o modelo de memoria small
.STACK 64 ; Aloga um espaço de 64 bytes para a pilha

.DATA ;Inicio da seção de dados
message db 'Mateus', "$"; Define uma mensagem

.CODE ; Inicio da seção de código
main proc; Define o inicio do procedimento principal

mov ax, @data ;Carrega o endereço do segmento em AX
mov ds, ax ; Move o valor em AX para o registrador DS

mov ah, 9h ;Preparar o registrador AH para a função 09h do DOS
mov dx, offset message; vai fazer o deslocamento da msg em DX

int 21h; Instrução de Interrupção

main endp ;Marca o fim
end main ; Indica o fim
