# 💻 Linguagem de Programação Francesa

Durante o ano de 2022 no curso de Ciências da Computação foi ministrado a disciplina de Compiladores. O intuito da matéria era ensinar o aluno quais as finalidades de um compilador, suas importâncias, e principalmente, como se constrói um compilador básico do zero. O professor nos engajou para que cada um fizesse a própria linguagem de programação, e a presente neste repositório é baseada no idioma Frânces. A intenção era programar uma linguagem mais simples como o Portugol, só que para fluentes do Frânces.

## Tecnologias utilizadas

No desenvolvimento deste compilador, foi utilizado:

- GCC
- YACC
- Flex
- Bison

## ❔ Como usar o compilador

Para utilizar este compilador, faça:

1. Clone este repositório em alguma pasta de seu computador;

2. Instale as tecnologias citadas acima;

3. Crie seu primeiro trecho de código com a Linguagem pertencente a este compilador com a sintaxe correta, e salve como .txt;

4. Dentro da pasta do compilador, execute a sequência de comados a seguir: 
   1. flex calc.l
   2. bison -d calc.y
   3. gcc calc.tab.c lex.yy.c header.c -o calcmp

Ou simplesmente use o comando:
   - make
   
5. Por fim, execute o seguinte comando com o nome do seu arquivo .txt que possui o código:
- ./calcmp nomeDoArquivo.txt
