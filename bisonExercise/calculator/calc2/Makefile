sim: lex.yy.c calc2.tab.c
	gcc -o sim lex.yy.c calc2.tab.c -lfl
lex.yy.c: calc2.lex
	flex calc2.lex
calc2.tab.c: calc2.y
	bison -d calc2.y

