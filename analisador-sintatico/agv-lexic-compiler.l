/*
 * Sample Scanner3: 
 * Description: Retrieve the tokens from code
 * Usage: (1) $ flex sample2.l
 *        (2) $ gcc lex.yy.c -ll (or -lfl)
 *        (3) $ ./a.out
 *        stdin> whatever you like
 *	  stdin> Ctrl-D
 */

%{
	#include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <ctype.h>
    #include "y.tab.h"
    void yyerror(char* c);

	int linha = 1;
	int comment = 0;

	void lexical_error(char* yytext) {
		fprintf(stderr, "Erro léxico na linha %d: %s\n", linha, yytext);
	}
%}

D 		[0-9]
L  		[a-zA-Z_]

%%

"/*" {
	comment = 1;
}

"*/" {
	comment = 0;
}

"//"(.)*\n {}	
\n {
	linha++;
}

[" " | \t] {}

\( {
	if(!comment) return L_PARENTHESIS;
}

\) {
	if(!comment) return R_PARENTHESIS;
}

\{ {
	if(!comment) return L_KEY;
}

\} {
	if(!comment) return R_KEY;
}

\[ {
	if(!comment) return L_BRACKET;
}

\] {
	if(!comment) return R_BRACKET;
}

"if" {
	if(!comment) return IF_STM;
}

"else" {
	if(!comment) return ELSE_STM;
}

"else if" {
	if(!comment) return ELSE_IF_STM;
}

"for" {
	if(!comment) return FOR_STM;
}

"do" {
	if(!comment) return DO;
}

"while" {
	if(!comment) return WHILE_STM;
}

"int\ " {
	if(!comment) return INT_TYPE;
}

"float\ " {
	if(!comment) return FLOAT_TYPE;
}

"double\ " {
	if(!comment) return DOUBLE_TYPE;
}

"string\ " {
	if(!comment) return STRING_TYPE;
}

"boolean\ " {
	if(!comment) return BOOLEAN_TYPE;
}

"matrix\ " {
	if(!comment) return MATRIX_TYPE;
}

"void\ " {
	if(!comment) return VOID_TYPE;
}

"const\ " {
	if(!comment) return CONSTANT;
}

"return"[" "|";"] {
	if(!comment) return RETURN;
}

"true" {
	if(!comment) return TRUE_VAL;
}

"false" {
	if(!comment) return FALSE_VAL;
}

{L}({L}|{D})* {
	if(!comment) return IDENTIFIER;
}

"+" {
	if(!comment) return PLUS_OP;
}

"-" {
	if(!comment) return SUB_OP;
}

"%" {
	if(!comment) return MOD_OP;
}

"**" {
	if(!comment) return FACT_OP;
}

"/" {
	if(!comment) return DIV_OP;
}

"*" {
	if(!comment) return STAR;
}

"++" {
	if(!comment) return INC_OP;
}

"--" {
	if(!comment) return DEC_OP;
}

"=" {
	if(!comment) return ASSINGMENT;
}

"&" {
	if(!comment) return ADDRESS;
}

"&&" {
	if(!comment) return AND_OP;
}

"||" {
	if(!comment) return OR_OP;
}

"==" {
	if(!comment) return EQ_OP;
}

"<" {
	if(!comment) return S_OP;
}

"<=" {
	if(!comment) return SE_OP;
}

">" {
	if(!comment) return G_OP;
}

">=" {
	if(!comment) return GE_OP;
}

";" {
	if(!comment) return SEMICOLON;
}

"," {
	if(!comment) return COMMA;
}

[0-9]+ {
	if(!comment) return LITERAL_INT;
}

[0-9]*\.[0-9]+f {
	if(!comment) return LITERAL_FLOAT;
}

[0-9]*\.[0-9]+ {
	if(!comment) return LITERAL_DOUBLE;
}

(\')([a-zA-Z])(\') {
	if(!comment) return LITERAL_CHAR;
}

"\""(.)*"\"" {
	if(!comment) return LITERAL_STRING;
}

(\')(.)+(\') {
	lexical_error(yytext);
}

. {
	lexical_error(yytext);
}
%%
