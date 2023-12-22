%{
#include <stdio.h>
#include <string.h>
#include "symbol.h"
%}
%union {
	double dval;
	struct symtab *symp;
}
%token <symp>	NAME
%token <dval> 	NUMBER
%type <dval> Fact Term Exp
%%
StmtList: StmtList Stmt'\n'	
	| Stmt'\n'		
	;

Stmt	: NAME'='Exp	{ $1->value = $3; }
	| Exp		{ printf("=%f\n", $1);}
	;

Exp	: Exp '+' Term  { $$=$1+$3; }
	| Term          { $$=$1; }
	;

Term	: Term '*' Term  { $$=$1*$3; }
	| Fact           { $$=$1; }
	;

Fact 	: NUMBER	{ $$=$1;}
	| NAME          { $$=$1->value; }
	| '('Exp')'     { $$=$2; }
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
