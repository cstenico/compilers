%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "hash.h"

void checkReservedWord(char* yytext);

hashtable_t *hashtable;

%}


NUMERO [0-9]
REAL {NUMERO}+"."{NUMERO}+
PALAVRA [a-zA-Z][a-zA-Z0-9_]*
NEW_LINE \n
TAB \t
SPACE [ ]
COMENTARIO [{].+[}]
COMENTARIO_ABERTO "{"[^}]*
NUM_ERRADO ([0-9]+\.[0-9]*[a-zA-Z]+([0-9]|[a-zA-Z])*|[0-9]*[a-zA-Z]+([0-9]|[a-zA-Z])*\.[0-9]+|[0-9]+[a-zA-Z]+([0-9]|[a-zA-Z])*)
%%

{NUMERO}+ {printf("< %d \t\t| NUM >\n",atoi(yytext));} 
{REAL} {printf("< %f \t\t| NUM_REAL >\n",atof(yytext));}
":=" {printf("< %s \t\t| SIMB_ASSIGN >\n",yytext);}
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
"\"" {printf("< %s \t\t| SIMB_ASPAS >\n",yytext);}
"&&" {printf("< %s \t\t| SIMB_AND >\n",yytext);}
"||" {printf("< %s \t\t| SIMB_OR >\n",yytext);}
"cos" {printf("< %s \t\t| TKN_COS >\n",yytext);} 
"sen" {printf("< %s \t\t| TKN_SEN >\n",yytext);}
{PALAVRA} {checkReservedWord(yytext);} 
{COMENTARIO_ABERTO} {printf("\n\n< ERRO: COMENTARIO ABERTO >\n\n");}
{NUM_ERRADO} {printf("\n\n< ERRO: TOKEN MAL FORMADO >\n\n");}

{NEW_LINE} {} 
{TAB} {} 
{SPACE} {} 
{COMENTARIO} {}

%%

void checkReservedWord(char* yytext){
    if (ht_get( hashtable, yytext )){
        printf("< %s \t\t| PALAVRA RESERVADA >\n",yytext);
    }else{
        printf("< %s \t\t| ID >\n",yytext);
    }
}

int main(){
    hashtable = ht_create( 65536 );

    ht_set( hashtable, "begin", " " );
    ht_set( hashtable, "end", " " );
    ht_set( hashtable, "real", " " );
    ht_set( hashtable, "integer", " " );
    ht_set( hashtable, "else", " " );
    ht_set( hashtable, "readln", " " );
    ht_set( hashtable, "repeat", " " );
    ht_set( hashtable, "until", " " );
    ht_set( hashtable, "if", " " );
    ht_set( hashtable, "then", " " );
    ht_set( hashtable, "while", " " );
    ht_set( hashtable, "do", " " );
    ht_set( hashtable, "read", " " );
    ht_set( hashtable, "program", " " );
    ht_set( hashtable, "write", " " );
    ht_set( hashtable, "procedure", " " );
    ht_set( hashtable, "var", " " );

    yylex();
    return 0;

}


