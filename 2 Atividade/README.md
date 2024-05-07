## O DOS (Disk Operating System) é um sistema operacional de linha de comando

#### Em Assembly MASM (Microsoft Macro Assembler) ou TASM (Turbo Assembler), você pode interagir com o DOS chamando as interrupções de software apropriadas. As interrupções de software são chamadas usando a instrução int, seguida do número da interrupção desejada.


#### Ele funciona se seguinte maneira:

#### Preparação dos registradores: Antes de chamar a interrupção do DOS, você normalmente prepara os registradores conforme necessário. Isso pode incluir carregar o segmento de dados (DS) com o endereço do segmento de dados usando mov ax, @data e mov ds, ax, como você fez em seu código.
#### Definição da função desejada: Você define a função desejada no registrador AH. No seu caso, você definiu AH como 9h, que é o código da função para exibir uma string.
#### Passagem de parâmetros: Dependendo da função que você está chamando, pode ser necessário passar parâmetros adicionais. Por exemplo, para exibir uma string, você precisa passar o endereço da string. Isso é feito carregando o registrador apropriado (por exemplo, DX) com o endereço da string.
#### Chamada da interrupção do DOS: Finalmente, você chama a interrupção do DOS usando a instrução int. O número da interrupção é 21h para a maioria das funções do DOS.
#### Processamento da interrupção: O DOS recebe a interrupção, verifica o valor em AH para determinar qual função você está solicitando e executa a função apropriada. Por exemplo, se AH for 9h, o DOS exibirá a string cujo endereço está no registrador DX.
#### Retorno ao seu programa: Após a execução da função do DOS, o controle retorna ao seu programa e você pode continuar com outras operações, se necessário.

## O seguinte código executado

```sh
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
```

### Retorna a seguinte Saida com o resultado "Mateus"

![alt text](<Resultado at2.png>)

## Funcionamento dos registradores


#### Em Assembly MASM/TASM, os registradores são usados para armazenar dados temporários, endereços de memória, valores de operação e outras informações necessárias para executar instruções de forma eficiente. Cada registrador tem um propósito específico e pode ser usado de maneiras diferentes dependendo do contexto do programa.
#### Exemplo:

#### AX, BX, CX, DX: São registradores de uso geral. Eles podem ser usados para armazenar dados temporários, endereços de memória ou valores de operação. Por exemplo, em operações aritméticas, você pode usar esses registradores para armazenar operandos e resultados.
#### SI, DI: São registradores de índice. Eles são frequentemente usados em operações de manipulação de strings e em operações de acesso a tabelas ou estruturas de dados.
#### BP, SP: São registradores de ponteiro de base e ponteiro de pilha, respectivamente. BP geralmente é usado como uma referência base para acessar variáveis locais em procedimentos. SP aponta para o topo da pilha e é usado para alocar e liberar espaço na pilha.
#### DS, ES, SS, CS: São registradores de segmento. Eles são usados para apontar para os segmentos de memória que contêm diferentes partes do programa ou dados. Por exemplo, DS geralmente aponta para o segmento de dados, enquanto CS aponta para o segmento de código.
#### AH, AL, BH, BL, CH, CL, DH, DL: São partes dos registradores AX, BX, CX e DX, respectivamente. Eles são usados para acessar os bytes mais significativos (AH, BH, CH, DH) ou menos significativos (AL, BL, CL, DL) dos registradores de 16 bits.

#### Durante a execução do programa, os valores são movidos entre esses registradores e a memória, e operações são realizadas neles para manipular dados e controlar o fluxo do programa. O conhecimento detalhado do funcionamento de cada registrador e suas características é essencial para escrever código Assembly eficiente e funcional.