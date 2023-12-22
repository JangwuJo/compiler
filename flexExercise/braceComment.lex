%x BRACE CMT
%%
\{ 		{
		  ECHO;
		  BEGIN BRACE;
		}
<BRACE>\} 	{
		  ECHO;
		  BEGIN 0;
		}
<BRACE>"/*"	BEGIN CMT;
<CMT>.		;
<CMT>"*/"	BEGIN BRACE;
.		ECHO;
\n		{
		  printf("\n");
		  return (0);
		}

