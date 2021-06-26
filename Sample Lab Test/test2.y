%{
    #include<stdio.h>
    void yyerror(char *s);
    int yylex();
%}

%token FNUM INUM TYPE MAIN WHILE ADD SUB ID EQUAL ASSIGN SEMI LB RB LP RP
%start program
%left ADD SUB

%%
program: statements {printf("Parsing matched\n");}
    ;

statements: TYPE MAIN LP RP LB id_declare id_declare WHILE LP number RP LB id_declare RB RB
    ;

id_declare: TYPE ID ASSIGN exp SEMI
            |ID ASSIGN exp SEMI
            ;

exp: exp ADD number
    |exp SUB number
    |exp ADD ID
    |exp SUB ID
    |exp EQUAL number
    |exp ASSIGN number
    |number
    |ID
    ;

number: FNUM
        |INUM
        ;   
%%

int main()
{
    yyparse();
    printf("Parsing finished\n");
}

void yyerror(char *s)
{
    fprintf(stderr, "Error: %s\n", s);
}