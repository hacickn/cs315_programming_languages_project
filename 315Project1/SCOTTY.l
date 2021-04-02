digit        										[0-9]
boolean 		 										true|false
signs        										[+-]
number_indicator								\$
integer      										{signs}?{digit}+
double       										{signs}?{digit}*(\.)?{digit}+
string      										\"[^\"]*\"
character    										{digit}|[A-Za-z]
comment      										\/\*.*\*\/
identifier   										[A-Za-z]{character}*
%%
{boolean}    										printf("BOOLEAN ");
{integer}    										printf("INTEGER ");
{double}     										printf("DOUBLE ");
{string}     										printf("STRING ");
{comment}		 										printf("COMMENT \n");
{number_indicator}							printf("NUMBER_INDICATOR ");
main														printf("MAIN ");
if															printf("IF ");
else 														printf("ELSE ");
forEach      										printf("FOR_EACH ");
for															printf("FOR ");
while														printf("WHILE ");
return													printf("RETURN ");
\+\+														printf("INCREMENT_ONE ");
\-\>                            printf("GET ");
\-\-					      						printf("DECREMENT_ONE ");
\+															printf("PLUS ");
\-															printf("MINUS ");
\*															printf("MULTIPLICATION ");
\/															printf("DIVISION ");
\,															printf("COMMA ");
\(															printf("LP ");
\)															printf("RP ");
\{															printf("LB ");
\}															printf("RB ");
\[															printf("LCB ");
\]															printf("RCB ");
\|\|														printf("OR ");
\~\|														printf("NOR ");
\&\&														printf("AND ");
\~\&														printf("NAND ");
\<\=\=\>												printf("IFF ");
\=\=\>													printf("IMPLICATION ");
\!															printf("EXCLAMATION ");
\<															printf("LT ");
\<\=														printf("LTE ");
\>															printf("GT ");
\>\=														printf("GTE ");
\=\=														printf("EQ_OP ");
\!\=														printf("NON_EQ_OP ");
function 												printf("FUNCTION ");
\=\>														printf("FUNCTION_ROUTER ");
in															printf("IN ");
print														printf("PRINT ");
printLine												printf("PRINT_LINE ");
var_object											printf("OBJECT_VAR ");
var_bool												printf("BOOL_VAR ");
cons_bool												printf("BOOL_CONS ");
var_number											printf("NUMBER_VAR ");
cons_number											printf("NUMBER_CONS ");
var_string											printf("STRING_VAR ");
cons_string											printf("STRING_CONS ");
var_list												printf("LIST_VAR ");
cons_list												printf("LIST_CONS ");
input														printf("INPUT ");
{identifier}										printf("IDENTIFIER ");
\;															printf("SEMICOLON \n");
\=															printf("ASSIGNMENT ");
[ \t\n]        ;
%%
int yywrap(void) {
	return 1;
}

int main(void) {
	yylex();
	return 0;
}
