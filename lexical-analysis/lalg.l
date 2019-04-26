%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// retornar {PALAVRA COMO VARIAVEL}
// FAZER VERIFICACAO
%}

NUMERO [0-9]
REAL {NUMERO}+"."{NUMERO}+
PALAVRA [a-zA-Z][a-zA-Z0-9_]*
NEW_LINE \n
TAB \t
SPACE [ ]
COMENTARIO [{].+[}]
%%

{NUMERO}+ {printf("<%d \t\t| NUM >\n",atoi(yytext));} 
{REAL} {printf("< %f \t\t| NUM_REAL >\n",atof(yytext));}
"=" {printf("< %s \t\t| SIMB_ASIGN >\n",yytext);}
";" {printf("< %s \t\t| SIMB_PTOCOMA >\n",yytext);}
"*" {printf("< %s \t\t| SIMB_MULT >\n",yytext);}
"/" {printf("< %s \t\t| SIMB_DIV >\n",yytext);} 
"+" {printf("< %s \t\t| SIMB_MAS >\n",yytext);} 
"-" {printf("< %s \t\t| SIMB_MENOS >\n",yytext);} 
"(" {printf("< %s \t\t| SIMB_PAA >\n",yytext);}
")" {printf("< %s \t\t| SIMB_PAC >\n",yytext);}
":" {printf("< %s \t\t| SIMB_DOIS_PTOS >\n",yytext);}
"." {printf("< %s \t\t| SIMB_PTO >\n",yytext);}
">" {printf("< %s \t\t| SIMB_MAIOR >\n",yytext);}
"<" {printf("< %s \t\t| SIMB_MENOR >\n",yytext);}
"," {printf("< %s \t\t| SIMB_VIRGULA >\n",yytext);}
"&&" {printf("< %s \t\t| SIMB_AND >\n",yytext);}
"||" {printf("< %s \t\t| SIMB_OR >\n",yytext);}
"cos" {printf("< %s \t\t| TKN_COS >\n",yytext);} 
"sen" {printf("< %s \t\t| TKN_SEN >\n",yytext);}
{PALAVRA} {printf("< %s \t\t| PALAVRA >\n",yytext);} 
{NEW_LINE} {} 
{TAB} {} 
{SPACE} {} 
{COMENTARIO} {}

%%

int main()
{
    yylex();
    return 0;
}


