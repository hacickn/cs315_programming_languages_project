%option yylineno
digit [0-9]
boolean true|false
signs [+-]
number_indicator \$
integer {signs}?{digit}+
double {signs}?{digit}*(\.)?{digit}+
string \"[^\"]*\"
character {digit}|[A-Za-z]
comment \/\*.*\*\/
identifier [A-Za-z]{character}*
%%
start				return(START_OF_PROGRAM);
end				return(END_OF_PROGRAM);
max				return(MAX);
min 				return(MIN);
sqrt				return(SQRT);
{boolean} 			return(BOOLEAN);
{integer} 			return(INTEGER);
{double} 			return(DOUBLE);
{string} 			return(STRING);
{comment} 			return(COMMENT);
{number_indicator} 		return(NUMBER_INDICATOR);
main 				return(MAIN);
if 				return(IF);
else 				return(ELSE);
else_if 			return(ELSE_IF);
forEach 			return(FOR_EACH);
for 				return(FOR);
while 				return(WHILE);
return				return(RETURN);
\+\+ 				return(INCREMENT_ONE);
\-\> 				return(GET);
\-\- 				return(DECREMENT_ONE);
\+ 				return(PLUS);
\- 				return(MINUS);
\* 				return(MULTIPLICATION);
\/ 				return(DIVISION);
\, 				return(COMMA);
\( 				return(LP);
\) 				return(RP);
\{ 				return(LCB);
\} 				return(RCB);
\[ 				return(LB);
\] 				return(RB);
\~				return(TILDE);
\|\| 				return(OR);
x\|				return(XOR);
\~\| 				return(NOR);
\&\& 				return(AND);
\~\& 				return(NAND);
\<\=\=\> 			return(IFF);
\=\=\> 			return(IMPLICATION);
\! 				return(EXCLAMATION);
\< 				return(LT);
\<\= 				return(LTE);
\> 				return(GT);
\>\= 				return(GTE);
\=\= 				return(EQ_OP);
\!\= 				return(NON_EQ_OP);
function 			return(FUNCTION);
\=\> 				return(FUNCTION_ROUTER);
in 				return(IN);
print 				return(PRINT);
printLine 			return(PRINT_LINE);
var_object 			return(OBJECT_VAR);
var_bool 			return(BOOL_VAR);
cons_bool 			return(BOOL_CONS);
var_number 			return(NUMBER_VAR);
cons_number 			return(NUMBER_CONS);
var_string 			return(STRING_VAR);
cons_string 			return(STRING_CONS);
var_list 			return(LIST_VAR);
cons_list 			return(LIST_CONS);
input 				return(INPUT);
{identifier} 			return(IDENTIFIER);
\; 				return(SEMICOLON);
\= 				return(ASSIGN);
\+\= 				return(PLUS_ASSIGN);
\-\= 				return(MINUS_ASSIGN);
\*\= 				return(MULTIPLICATION_ASSIGN);
\/\= 				return(DIVISION_ASSIGN);
[ \t\n] ;
%%
int yywrap(void) {
	return 1;
}