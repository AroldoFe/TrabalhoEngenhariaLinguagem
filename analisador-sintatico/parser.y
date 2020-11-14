%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

void yyerror(char *c);
int yylex(void);
%}


%token LITERAL_INT LITERAL_FLOAT LITERAL_DOUBLE LITERAL_CHAR LITERAL_STRING
%token PLUS_OP SUB_OP DIV_OP EOL 
%left PLUS_OP SUB_OP

%token TRUE_VAL FALSE_VAL
%token AND_OP OR_OP S_OP SE_OP G_OP GE_OP EQ_OP

%start PROGRAM

%%
PROGRAM : EXPR EOL
        | PROGRAM EXPR EOL
        ; 

EXPR : ARIT_EXPR {$$ = $1;}
     | LOG_EXPR {$$ = $1;}
     ;


ARIT_EXPR : TERM {$$ = $1;}
        | TERM PLUS_OP ARIT_EXPR {$$ = $1;}
        | TERM SUB_OP ARIT_EXPR {$$ = $1 - $3;}
        | TERM DIV_OP ARIT_EXPR {$$ = $1 / $3;}   
        ;

TERM    : LITERAL_INT {$$ = $1;}
        | LITERAL_FLOAT {$$ = $1;}
        | LITERAL_DOUBLE {$$ = $1;}
        | LITERAL_CHAR {$$ = $1;}
        | LITERAL_STRING {$$ = $1;}
        ;

LOG_EXPR : TERM_LOG {$$ = $1;}
         |  ARIT_EXPR AND_OP LOG_EXPR  {$$ = $1 && $3;}
         |  ARIT_EXPR OR_OP LOG_EXPR  {$$ = $1 || $3;}
         |  ARIT_EXPR S_OP LOG_EXPR  {$$ = $1 < $3;}
         |  ARIT_EXPR SE_OP LOG_EXPR  {$$ = $1 <= $3;}
         |  ARIT_EXPR G_OP LOG_EXPR  {$$ = $1 > $3;}
         |  ARIT_EXPR GE_OP LOG_EXPR  {$$ = $1 >= $3;}
         |  ARIT_EXPR EQ_OP LOG_EXPR  {$$ = $1 == $3;}
         ;

TERM_LOG : TRUE_VAL {$$ = $1;}
         | FALSE_VAL {$$ = $1;}
         ;
%%

void yyerror(char* c){
    printf ("%s\n", c);
}

int main() {
    return yyparse();
}