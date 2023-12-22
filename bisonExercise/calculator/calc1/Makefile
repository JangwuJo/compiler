sim: lex.yy.c calc1.tab.c
	gcc -o sim lex.yy.c calc1.tab.c -lfl
lex.yy.c: calc1.lex
	flex calc1.lex
calc1.tab.c: calc1.y
	bison -d calc1.y

