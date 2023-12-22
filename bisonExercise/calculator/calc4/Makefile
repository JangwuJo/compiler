sim: lex.yy.c calc4.tab.c
	gcc -o sim lex.yy.c calc4.tab.c -lfl
lex.yy.c: calc4.lex
	flex calc4.lex
calc4.tab.c: calc4.y
	bison -d calc4.y

