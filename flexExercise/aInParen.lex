%{
#include <stdio.h>
int count=0;
%}
%s PAREN
%%
\( 		BEGIN PAREN;
<PAREN>a	count++;
\)		BEGIN 0;
.		;
\n		{
		  printf(" # of a: %d\n", count);
		  exit(-1);
		}
