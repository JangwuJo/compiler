%{
#include <stdio.h>
double vbltables[26];
%}
%union {
	double dval;
	int vblno;
}
%token <vblno>	NAME
%token <dval> 	NUMBER
%type <dval> Fact Term Exp
%%
StmtList: StmtList Stmt'\n'	
	| Stmt'\n'		
	;

Stmt	: NAME'='Exp	{ vbltables[$1] = $3; }
	| Exp		{ printf("=%f\n", $1);}
	;

Exp	: Exp '+' Term  { $$=$1+$3; }
	| Term          { $$=$1; }
	;

Term	: Term '*' Term  { $$=$1*$3; }
	| Fact           { $$=$1; }
	;

Fact 	: NUMBER	{ $$=$1;}
	| NAME          { $$=vbltables[$1]; }
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
