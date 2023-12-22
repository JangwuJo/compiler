sim: lex.yy.c calc6.tab.c symbol.c
	gcc -o sim lex.yy.c calc6.tab.c symbol.c -lfl -lm
lex.yy.c: calc6.lex symbol.h
	flex calc6.lex
calc6.tab.c: calc6.y symbol.h
	bison -d calc6.y

