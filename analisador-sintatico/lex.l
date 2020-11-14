
%{
	#include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <ctype.h>
    #include "y.tab.h"
    void yyerror(char* c);
%}

%%

\n {
    return EOL;
}

[0-9]+ {
    yylval = atoi(yytext);
    return LITERAL_INT;
}

[0-9]*\.[0-9]+f {
    yylval = atof(yytext);
    return LITERAL_FLOAT;
}

[0-9]*\.[0-9]+ {
    return LITERAL_DOUBLE;
}

(\')([a-zA-Z])(\') {
    return LITERAL_CHAR;
}
"\""(.)*"\"" {
    return LITERAL_STRING;
}

"true" {
    return TRUE_VAL;
}

"false" {
    return FALSE_VAL;
}

"+" {
    return PLUS_OP;
}

"-"	{
    return SUB_OP;
}

"/"	{
    return DIV_OP;
}

"==" {
    return EQ_OP;
}

"&&" {
    return AND_OP;
}

"||" {
    return OR_OP;
}

[<]	{
    return S_OP;
}
[<=] {
    return SE_OP;
}

[>]	{
    return G_OP;
}

[>=] {
    return GE_OP;
}

. ;

%%

int yywrap() {
  return 1;
}
