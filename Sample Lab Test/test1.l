%option noyywrap

%{
#include<stdio.h>
%}

delin [ \t\n]
ws {delin}+
digit [0-9]
number {digit}+
dot [.]
fraction {number}{dot}{number}
letter [A-Za-z]
us [_]
id ({us}|{letter})({letter}|{us}|{digit})*

%%
{ws} {}
{fraction} {printf("%s => FLOAT\n", yytext);}
{number} {printf("%s => INT\n", yytext);}

"double"|"float"|"int" {printf("%s => TYPE SPECIFIER\n", yytext);}
"main" {printf("%s => FUNCTION NAME\n", yytext);}
"while" {printf("%s => LOOP KEYWORD\n", yytext);}

"(" {printf("%s => LP\n", yytext);}
")" {printf("%s => RP\n", yytext);}
"{" {printf("%s => LB\n", yytext);}
"}" {printf("%s => RB\n", yytext);}

"+" {printf("%s => ADD\n", yytext);}
"-" {printf("%s => SUB\n", yytext);}

{id} {printf("%s => ID\n", yytext);}

"==" {printf("%s => EQUAL\n", yytext);}
"=" {printf("%s => ASSIGN\n", yytext);}
";" {printf("%s => SEMI\n", yytext);}
. {printf("%s => Unknown\n", yytext);}
%%

int main()
{
    yylex();
} 