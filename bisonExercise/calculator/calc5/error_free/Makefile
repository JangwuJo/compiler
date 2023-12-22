sim: lex.yy.c calc5.tab.c symbol.c
	gcc -o sim lex.yy.c calc5.tab.c symbol.c -lfl
lex.yy.c: calc5.lex symbol.h
	flex calc5.lex
calc5.tab.c: calc5.y symbol.h
	bison -d calc5.y

