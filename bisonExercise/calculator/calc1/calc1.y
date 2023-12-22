%{
#include <stdio.h>
%}
%token	NUMBER
%%
Exp	: Exp '+' Term  { printf("rule 1\n"); }
	| Term          { printf("rule 2\n"); }
	;

Term	: Term '*' Num  { printf("rule 3\n"); }
	| Num           { printf("rule 4\n"); }
	;

Num 	: NUMBER	{ printf("rule 5\n"); }
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
