%x CMT
%%
"/*"		BEGIN CMT;
<CMT>.		;
<CMT>\n		;
<CMT>"*/"	BEGIN 0;
program		printf("TPROGRAM");

