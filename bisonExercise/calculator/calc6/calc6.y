%{
#include <stdio.h>
#include <string.h>
//#include <math.h>
#include "symbol.h"
%}
%union {
	double dval;
	struct symtab *symp;
}
%token <symp>	NAME FUNC
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
	| FUNC'('Exp')' { $$=$1->funcptr($3); }
  	; 
%%

void yyerror(char *msg) {
    printf("my error message\n");
}

void addfunc(char * name, double (*func)(double)) {
	struct symtab * sp = symlook(name);
	sp->funcptr = func;
}

int main() {
	extern double sqrt(double), exp(double), log(double);

	addfunc("sqrt", sqrt);
	addfunc("exp", exp);
	addfunc("log", log);

	yyparse();
}


