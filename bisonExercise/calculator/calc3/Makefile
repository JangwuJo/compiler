sim: lex.yy.c calc3.tab.c
	gcc -o sim lex.yy.c calc3.tab.c -lfl
lex.yy.c: calc3.lex
	flex calc3.lex
calc3.tab.c: calc3.y
	bison -d calc3.y

