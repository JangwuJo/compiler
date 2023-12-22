%{
#include <stdlib.h>
#include "symbol.h"
#include "calc6.tab.h"
%}
%%
[0-9]+|([0-9]*\.[0-9]+) {
		  yylval.dval = atof(yytext);
	 	  return(NUMBER);
		}
[ \t]		;
[A-Za-z][A-Za-z0-9]*    {
		 struct symtab *sp = symlook(yytext);
		 yylval.symp = sp;

		 if(sp->funcptr)  /* Is it a function? */
			return FUNC;
		 else
                 	return NAME;
		}
\$		return(0);
\n		|
.		{
		  return(yytext[0]);
		}
