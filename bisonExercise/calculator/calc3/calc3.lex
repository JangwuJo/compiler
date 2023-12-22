%{
#include <stdlib.h>
#include <stdio.h>
#include "calc3.tab.h"
//extern int yylval;
%}
%%
[0-9]+ 		{
		  yylval = atoi(yytext);
	 	  return(NUMBER);
		}
[ \t]		;
\$		return(0);
\n		|
.		{
		  return(yytext[0]);
		}
