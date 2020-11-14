
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

[+] {
    return PLUS_OP;
}

[-]	{
    return SUB_OP;
}

[/]	{
    return DIV_OP;
}

. ;

%%

int yywrap() {
  return 1;
}
