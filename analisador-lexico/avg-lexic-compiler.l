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
	int linha = 1;
	int comment = 0;

	void lexical_error(char* yytext) {
		fprintf(stderr, "Erro léxico na linha %d: %s\n", linha, yytext);
	}
%}

D 		[0-9]
L  		[a-zA-Z_]

%%

"/*"					{comment = 1;}
"*/"					{comment = 0;}
"//."					{}	
\n 						{linha++;}

[" " | \t]		  		{}
\#[include]\ \<(.)+[.h]\>{if(!comment) printf("IMPORTATION PROCESS\n");}
\(       				{if(!comment) printf("L_PARENTHESIS\n");}
\)       				{if(!comment) printf("R_PARENTHESIS\n");}
\{       				{if(!comment) printf("L_KEY\n");}
\}       				{if(!comment) printf("R_KEY\n");}
\[       				{if(!comment) printf("L_BRACKET\n");}
\]       				{if(!comment) printf("R_BRACKET\n");}
"if"					{if(!comment) printf("IF_STM\n");}
"else"					{if(!comment) printf("ELSE_STM\n");}
"else if"				{if(!comment) printf("ELSE_IF_STM\n");}
"for" 					{if(!comment) printf("FOR_STM\n");}
"do" 					{if(!comment) printf("DO\n");}
"while" 				{if(!comment) printf("WHILE_STM\n");}
"int\ "					{if(!comment) printf("INT_TYPE\n");}
"float\ "				{if(!comment) printf("FLOAT_TYPE\n");}
"double\ "				{if(!comment) printf("DOUBLE_TYPE\n");}
"string\ "				{if(!comment) printf("STRING_TYPE\n");}
"boolean\ "				{if(!comment) printf("BOOLEAN_TYPE\n");}
"matrix\ "				{if(!comment) printf("MATRIX_TYPE\n");}
"void\ "				{if(!comment) printf("VOID_TYPE\n");}
"const\ "				{if(!comment) printf("CONSTANT\n");}
"return\ "				{if(!comment) printf("RETURN\n");}
"true"					{if(!comment) printf("TRUE_VAL\n");}
"false"					{if(!comment) printf("FALSE_VAL\n");}
{L}({L}|{D})* 			{if(!comment) printf("IDENTIFIER\n");}
"+"						{if(!comment) printf("PLUS_OP\n");}
"-"						{if(!comment) printf("SUB_OP\n");}
"%"						{if(!comment) printf("MOD_OP\n");}
"**"					{if(!comment) printf("FACT_OP\n");}
"/"						{if(!comment) printf("DIV_OP\n");}
"*"						{if(!comment) printf("STAR\n");}
"++"					{if(!comment) printf("INC_OP\n");}
"--"					{if(!comment) printf("DEC_OP\n");}
"="						{if(!comment) printf("ASSINGMENT\n");}
"&"					    {if(!comment) printf("ADDRESS\n");}
"&&"					{if(!comment) printf("AND_OP\n");}
"||"					{if(!comment) printf("OR_OP\n");}
"=="					{if(!comment) printf("EQ_OP\n");}
"<"						{if(!comment) printf("S_OP\n");}
"<="					{if(!comment) printf("SE_OP\n");}
">"						{if(!comment) printf("G_OP\n");}
">="					{if(!comment) printf("GEQ_OP\n");}
";"					    {if(!comment) printf("SEMICOLON\n");}
","					    {if(!comment) printf("COMMA\n");}
[0-9]+					{if(!comment) printf("LITERAL_INT(%s)\n", yytext);}
[0-9]*\.[0-9]+f  		{if(!comment) printf("LITERAL_FLOAT(%s)\n", yytext);}
[0-9]*\.[0-9]+  		{if(!comment) printf("LITERAL_DOUBLE(%s)\n", yytext);}
(\')([a-zA-Z])(\')		{if(!comment) printf("LITERAL_CHAR(%s)\n", yytext);}
"\""(.)*"\""			{if(!comment) printf("LITERAL_STRING(%s)\n", yytext);}
(\')(.)+(\')			{lexical_error(yytext);}

. 						{lexical_error(yytext);}
%%

int main(void) {
  yylex();
  return 0;
}
