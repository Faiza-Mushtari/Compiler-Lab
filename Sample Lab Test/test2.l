%option noyywrap

%{
#include "test2.tab.h"
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
{fraction} {yylval = atoi(yytext); return(FNUM);}
{number} {yylval = atoi(yytext); return(INUM);}

"double"|"float"|"int" {return(TYPE);}
"main" {return(MAIN);}
"while" {return(WHILE);}

{id} {return(ID);}

"==" {return(EQUAL);}
"=" {return(ASSIGN);}
";" {return(SEMI);}

"+" {return(ADD);}
"-" {return(SUB);}

"(" {return(LP);}
")" {return(RP);}
"{" {return(LB);}
"}" {return(RB);}
%%