%token BOOLEAN INTEGER DOUBLE STRING COMMENT NUMBER_INDICATOR MAIN IF ELSE ELSE_IF FOR_EACH FOR WHILE RETURN INCREMENT_ONE GET DECREMENT_ONE PLUS MINUS MULTIPLICATION DIVISION COMMA LP RP LB RB LCB RCB OR NOR AND NAND IFF IMPLICATION EXCLAMATION LT LTE GT GTE EQ_OP NON_EQ_OP FUNCTION FUNCTION_ROUTER IN PRINT PRINT_LINE OBJECT_VAR BOOL_VAR BOOL_CONS NUMBER_VAR NUMBER_CONS XOR STRING_VAR STRING_CONS LIST_VAR LIST_CONS INPUT IDENTIFIER SEMICOLON ASSIGN PLUS_ASSIGN MINUS_ASSIGN MULTIPLICATION_ASSIGN DIVISION_ASSIGN TILDE START_OF_PROGRAM END_OF_PROGRAM MAX MIN SQRT 
%%
programs:			START_OF_PROGRAM program END_OF_PROGRAM | START_OF_PROGRAM program END_OF_PROGRAM programs

program:                    functions main {printf("Input program is valid\n"); return 0;} | main functions {printf("Input program is valid\n"); return 0;}| functions main functions 					{printf("Input program is valid\n"); return 0;}| main {printf("Input program is valid\n"); return 0;} ;

functions:			function_declaration | function_declaration functions | COMMENT | COMMENT functions;			

function_declaration:	FUNCTION IDENTIFIER LP types RP FUNCTION_ROUTER code_block ;

main:				MAIN FUNCTION_ROUTER code_block ;

code_block:			LCB statements RCB ;

statements:                 statement SEMICOLON | statement SEMICOLON statements | COMMENT | COMMENT statements ;

statement:                  expression | loop | conditional | empty | RETURN type ;

expression:			io | declarations | assignments ;

loop:				for_loop | for_each | while_loop ;

conditional:			if | if else | if else_if ;  			

io:				input | output ;

declarations:			function_call | bool_declaration | cons_bool_declaration | string_declaration | cons_string_declaration | number_declaration | 									cons_number_declaration | list_declaration | cons_list_declaration | object_declaration ;

assignments:			bool_assignment | string_assignment | number_assignment | list_assignment | element_of_list_assignment | object_assignment | 										element_of_object_assignment ;

for_loop:			FOR LP	expression SEMICOLON bool_operation SEMICOLON assignments RP code_block ;	

for_each:			FOR_EACH LP IDENTIFIER IN list RP code_block | FOR_EACH LP IDENTIFIER IN element_of_object RP code_block ;

while_loop:			WHILE LP bool_operation RP code_block ;

if:				IF LP bool_operation RP code_block ;

else:				ELSE code_block ;

else_if:			ELSE_IF LP bool_operation RP code_block |  ELSE_IF LP bool_operation RP code_block else_if | ELSE_IF LP bool_operation RP code_block else ;

input:				INPUT LP IDENTIFIER RP | INPUT LP NUMBER_INDICATOR IDENTIFIER RP ;

output:			PRINT LP types RP | PRINT_LINE LP types RP;

function_call:		IDENTIFIER LP types RP | MAX LP type RP | MIN LP type RP | SQRT LP number_operation RP;

bool_declaration:		BOOL_VAR IDENTIFIER | BOOL_VAR bool_assignment ;

cons_bool_declaration:	BOOL_CONS bool_assignment ;

string_declaration:		STRING_VAR IDENTIFIER | STRING_VAR string_assignment ;

cons_string_declaration:	STRING_CONS string_assignment ;

number_declaration:		NUMBER_VAR NUMBER_INDICATOR IDENTIFIER | NUMBER_VAR number_assignment ;

cons_number_declaration:    NUMBER_CONS number_assignment ;

list_declaration:		LIST_VAR IDENTIFIER | LIST_VAR list_assignment ;

cons_list_declaration:	LIST_CONS list_assignment ;

object_declaration:		OBJECT_VAR IDENTIFIER | OBJECT_VAR object_assignment ;

bool_assignment:		IDENTIFIER ASSIGN bool_operation ;

string_assignment:		IDENTIFIER ASSIGN STRING | IDENTIFIER PLUS_ASSIGN STRING ;

number_assignment:		NUMBER_INDICATOR IDENTIFIER ASSIGN number_operation | NUMBER_INDICATOR IDENTIFIER PLUS_ASSIGN number_operation | NUMBER_INDICATOR IDENTIFIER MINUS_ASSIGN 					number_operation | NUMBER_INDICATOR IDENTIFIER MULTIPLICATION_ASSIGN number_operation | NUMBER_INDICATOR IDENTIFIER DIVISION_ASSIGN number_operation | 						NUMBER_INDICATOR IDENTIFIER INCREMENT_ONE | NUMBER_INDICATOR IDENTIFIER DECREMENT_ONE | INCREMENT_ONE NUMBER_INDICATOR IDENTIFIER | DECREMENT_ONE NUMBER_INDICATOR 				  IDENTIFIER ;

list_assignment:		IDENTIFIER ASSIGN list ;

element_of_list_assignment: element_of_list ASSIGN type ;

element_of_object_assignment: element_of_object ASSIGN type ;

element_of_object: 		IDENTIFIER GET element_of_object | IDENTIFIER GET IDENTIFIER;

object_assignment:		IDENTIFIER ASSIGN object ;

types:				empty | type | type COMMA types ;

bool_operation:		bool_type bool_operator bool_operation | bool_type |  TILDE bool_type | LP bool_operation RP ;

number_operation:		number_type operator number_operation | number_type | LP number_operation RP ;

list:				LB types RB;

element_of_list:		IDENTIFIER LB number_operation RB ;

type:				number_operation | bool_operation | STRING | list | object;

object:			LCB object_types RCB	;

bool_operator:		OR | NOR | AND | NAND | IFF | IMPLICATION ;

operator:			PLUS | MINUS | MULTIPLICATION | DIVISION ;

object_types:			declarations | declarations COMMA object_types | object ;

comparison_operator:		LT | LTE | GT | GTE | EQ_OP | NON_EQ_OP ;

number_type:			INTEGER | DOUBLE | NUMBER_INDICATOR IDENTIFIER | NUMBER_INDICATOR element_of_object | NUMBER_INDICATOR element_of_list;

bool_type:			BOOLEAN | function_call | IDENTIFIER | bool_with_numbers | element_of_list | element_of_object;

bool_with_numbers:		number_operation comparison_operator number_operation;

empty:				;
%%
#include "lex.yy.c"
extern int yylineno;
main() {
  return yyparse();
}
int yyerror( char *s ) { 
  printf("Syntax error on line %d!\n", yylineno); 
}