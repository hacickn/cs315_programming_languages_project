parser: y.tab.c
	gcc -o parser y.tab.c
y.tab.c: CS315s21_team17.yacc lex.yy.c
	yacc CS315s21_team17.yacc
lex.yy.c: CS315s21_team17.lex
	lex CS315s21_team17.lex