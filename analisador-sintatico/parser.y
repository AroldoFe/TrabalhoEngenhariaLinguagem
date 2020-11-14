%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

void yyerror(char *c);
int yylex(void);
%}


%token LITERAL_INT LITERAL_FLOAT LITERAL_DOUBLE LITERAL_CHAR LITERAL_STRING
%token PLUS_OP SUB_OP DIV_OP EOL MOD_OP FACT_OP STAR INC_OP DEC_OP
%left PLUS_OP SUB_OP

%token TRUE_VAL FALSE_VAL
%token AND_OP OR_OP S_OP SE_OP G_OP GE_OP EQ_OP 
%token L_PARENTHESIS R_PARENTHESIS L_KEY R_KEY L_BRACKET R_BRACKET
%token IF_STM ELSE_STM ELSE_IF_STM FOR_STM DO_STM WHILE_STM
%token INT_TYPE FLOAT_TYPE DOUBLE_TYPE STRING_TYPE BOOLEAN_TYPE MATRIX_TYPE VOID_TYPE CHAR_TYPE
%token CONSTANT RETURN
%token ASSINGMENT ADDRESS SEMICOLON COMMA IDENTIFIER

%start PROGRAM

%%
PROGRAM : EXPR  EOL
        | PROGRAM EXPR EOL
        | IF_STATEMENT EOL
        | LOOP_STATEMENT EOL
        ; 

ASSGMT  : IDENTIFIER ASSINGMENT EXPR {updateSymbolVal($1,$3);}
        ; 

EXPR    : ARIT_EXPR {$$ = $1;}
        | LOG_EXPR {$$ = $1;}
        ;

ARIT_EXPR   : TERM {$$ = $1;}
            | TERM PLUS_OP ARIT_EXPR {$$ = $1 + $3;}
            | TERM SUB_OP ARIT_EXPR {$$ = $1 - $3;}
            | TERM DIV_OP ARIT_EXPR {$$ = $1 / $3;}
            | TERM STAR ARIT_EXPR {$$ = $1 * $3;}   
            ;

TERM    : LITERAL_INT {$$ = $1;}
        | LITERAL_FLOAT {$$ = $1;}
        | LITERAL_DOUBLE {$$ = $1;}
        | LITERAL_CHAR {$$ = $1;}
        | LITERAL_STRING {$$ = $1;}
        | IDENTIFIER
        | IDENTIFIER INC_OP
        | IDENTIFIER DEC_OP
        | INC_OP IDENTIFIER
        | DEC_OP IDENTIFIER
        ;

LOG_EXPR    : TERM_LOG {$$ = $1;}
            |  LOG_EXPR AND_OP LOG_EXPR  {$$ = $1 && $3;}
            |  LOG_EXPR OR_OP LOG_EXPR  {$$ = $1 || $3;}
            |  ARIT_EXPR S_OP ARIT_EXPR  {$$ = $1 < $3;}
            |  ARIT_EXPR SE_OP ARIT_EXPR  {$$ = $1 <= $3;}
            |  ARIT_EXPR G_OP ARIT_EXPR  {$$ = $1 > $3;}
            |  ARIT_EXPR GE_OP ARIT_EXPR  {$$ = $1 >= $3;}
            |  ARIT_EXPR EQ_OP ARIT_EXPR  {$$ = $1 == $3;}
            ;

TERM_LOG    : TRUE_VAL {$$ = $1;}
            | FALSE_VAL {$$ = $1;}
            ;

IF_STATEMENT    : IF_BLOCK
                | IF_BLOCK ELSE_BLOCK
                | IF_BLOCK ELSE_IF_BLOCK ELSE_BLOCK
                ;

IF_BLOCK    : IF_STM CONDITION_STATEMENT BODY_STATEMENT
            ;

ELSE_IF_BLOCK   : ELSE_IF_STM CONDITION_STATEMENT BODY_STATEMENT
                | ELSE_IF_BLOCK ELSE_IF_BLOCK
                ;

ELSE_BLOCK  : ELSE_STM BODY_STATEMENT
            ;

BODY_STATEMENT  : L_KEY PROGRAM R_KEY
                | L_KEY PROGRAM R_KEY EOL
                | L_KEY EOL PROGRAM R_KEY
                | L_KEY EOL PROGRAM R_KEY EOL
                ;

FOR_STATEMENT   : FOR_STM FOR_CONDITION_STATEMENT BODY_STATEMENT
                ;

FOR_CONDITION_STATEMENT : CONDITION_STATEMENT
                        | L_PARENTHESIS ASSGMT SEMICOLON LOG_EXPR SEMICOLON ARIT_EXPR R_PARENTHESIS
                        ;

WHILE_STATEMENT : WHILE_STM CONDITION_STATEMENT BODY_STATEMENT
                ;

DO_STATEMENT    : DO_STM BODY_STATEMENT WHILE_STM CONDITION_STATEMENT
                ;

LOOP_STATEMENT  : FOR_STATEMENT
                | WHILE_STATEMENT
                | DO_STATEMENT
                ;

CONDITION_STATEMENT : L_PARENTHESIS LOG_EXPR R_PARENTHESIS
                    ;

%%

int computeSymbolIndex(char token)
{
	int idx = -1;
	if(islower(token)) {
		idx = token - 'a' + 26;
	} else if(isupper(token)) {
		idx = token - 'A';
	}
	return idx;
} 

int symbolVal(char symbol)
{
	int bucket = computeSymbolIndex(symbol);
	return symbols[bucket];
}

void updateSymbolVal(char symbol, int val) {
        int bucket = computeSymbolIndex(symbol);
        symbols[bucket] = val;
}

void yyerror(char* c){
    printf ("%s\n", c);
}

int main() {
        int i;
	
        for(i=0; i<52; i++) {
		symbols[i] = 0;
	}

        return yyparse();
}