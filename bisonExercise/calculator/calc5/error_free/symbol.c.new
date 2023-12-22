//symbol.c

#include <string.h>
#include <stdlib.h>
#include "symbol.h"

//look up a symbol table entry, add if not present

struct symtab symtab[NSYMS];

struct symtab *symlook(char *s)
{
   struct symtab *sp;

   for(sp=symtab; sp < &symtab[NSYMS]; sp++) {
	/* Is it already here ? */
	if (sp->name && !strcmp(sp->name, s))
	   return sp;
	/* Is it not here */
	if(!sp->name) {
	   sp->name=strdup(s);
	   return sp;
	}
	/* otherwise continue to next */
   }
   yyerror("Too many symbols");
   exit(-1);
}
