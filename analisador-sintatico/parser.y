%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

void yyerror(char *c);
int yylex(void);
%}

%token LITERAL_INT PLUS_OP SUB_OP DIV_OP EOL
%left PLUS_OP SUB_OP
%start PROGRAM

%%
PROGRAM: EXPR EOL
       | PROGRAM EXPR EOL
       ; 


EXPR    : TERM {$$ = $1;}
        | TERM PLUS_OP TERM {$$ = $1 + $3;}
        | TERM SUB_OP TERM {$$ = $1 - $3;}
        | TERM DIV_OP TERM {$$ = $1 / $3;}   
        ;

TERM    : LITERAL_INT {$$ = $1;}
        ;

   
%%

void yyerror(char* c){
    printf ("%s\n", c);
}

int main() {
    return yyparse();
}