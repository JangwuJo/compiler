// symbol.h
#define NSYMS 20  /* maximum number of symbols */
struct symtab {
	char * name;
	double (*funcptr)(double);
	double value;
}; 

struct symtab *symlook();


