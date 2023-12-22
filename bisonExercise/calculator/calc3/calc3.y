%{
#include <stdio.h>
%}
%token	NUMBER
%%
ExpList	: ExpList Exp'\n'	{ printf("=%d\n", $2);}
	| Exp'\n'		{ printf("=%d\n", $1);}
	;

Exp	: Exp '+' Term  { $$=$1+$3; }
	| Term          { $$=$1; }
	|
	;

Term	: Term '*' Num  { $$=$1*$3; }
	| Num           { $$=$1; }
	|
	;

Num 	: NUMBER	{ $$=$1;}
	|
  	; 
%%
void yyerror(char *msg) {
    printf("my error message\n");
}


int main() {
/*  */
	yyparse();
/*  */
}
