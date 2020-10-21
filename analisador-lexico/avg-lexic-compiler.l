/*
 * Sample Scanner3: 
 * Description: Retrieve the tokens from code
 * Usage: (1) $ flex sample2.l
 *        (2) $ gcc lex.yy.c -ll (or -lfl)
 *        (3) $ ./a.out
 *        stdin> whatever you like
 *	  stdin> Ctrl-D
 */

D 		[0-9]
L  		[a-zA-Z_]

%%
[\n," ",\t]		  		{}
\(       				{printf("L_PARENTHESIS\n");}
\)       				{printf("R_PARENTHESIS\n");}
\{       				{printf("L_KEY\n");}
\}       				{printf("R_KEY\n");}
\[       				{printf("L_BRACKET\n");}
\]       				{printf("R_BRACKET\n");}
"if"					{printf("IF\n");}
"for" 					{printf("FOR\n");}
"int\ "					{printf("INT_TYPE\n");}
"float\ "				{printf("FLOAT_TYPE\n");}
"double\ "				{printf("DOUBLE_TYPE\n");}
"string\ "				{printf("STRING_TYPE\n");}
"matrix\ "				{printf("MATRIX_TYPE\n");}
"void\ "				{printf("VOID_TYPE\n");}
{L}({L}|{D})* 			{printf("IDENTIFIER\n");}
"+"						{printf("PLUS_OPERATION\n");}
"-"						{printf("SUB_OPERATION\n");}
"//"					{printf("MOD_OPERATION\n");}
"**"					{printf("EXP_OPERATION\n");}
"/"						{printf("DIV_OPERATION\n");}
"*"						{printf("MULT_OPERATION\n");}
"="						{printf("ASSIGNMENT\n");}
"=="					{printf("EQUAL_SIGN\n");}
"<"						{printf("LESS\n");}
"<="					{printf("LESS_EQUAL\n");}
">"						{printf("GREATER\n");}
">="					{printf("GREATER_EQUAL\n");}
{"\""}({L}|{D}|{"\ "})*{"\""} 	{printf("LITERAL_STRING(%s)\n", yytext);}
[0-9]+					{printf("LITERAL_INT(%s)\n", yytext);}
[0-9]*\.[0-9]+f  		{printf("LITERAL_FLOAT(%s)\n", yytext);}
[0-9]*\.[0-9]+  		{printf("LITERAL_DOUBLE(%s)\n", yytext);}
. 						{printf("FALTA_TOKEN(%s)\n", yytext);}
%%

int main(void) {
  yylex();
  
  return 0;
}
