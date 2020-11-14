/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    LITERAL_INT = 258,
    LITERAL_FLOAT = 259,
    LITERAL_DOUBLE = 260,
    LITERAL_CHAR = 261,
    LITERAL_STRING = 262,
    PLUS_OP = 263,
    SUB_OP = 264,
    DIV_OP = 265,
    EOL = 266,
    MOD_OP = 267,
    FACT_OP = 268,
    STAR = 269,
    INC_OP = 270,
    DEC_OP = 271,
    TRUE_VAL = 272,
    FALSE_VAL = 273,
    AND_OP = 274,
    OR_OP = 275,
    S_OP = 276,
    SE_OP = 277,
    G_OP = 278,
    GE_OP = 279,
    EQ_OP = 280,
    L_PARENTHESIS = 281,
    R_PARENTHESIS = 282,
    L_KEY = 283,
    R_KEY = 284,
    L_BRACKET = 285,
    R_BRACKET = 286,
    IF_STM = 287,
    ELSE_STM = 288,
    ELSE_IF_STM = 289,
    FOR_STM = 290,
    DO_STM = 291,
    WHILE_STM = 292,
    INT_TYPE = 293,
    FLOAT_TYPE = 294,
    DOUBLE_TYPE = 295,
    STRING_TYPE = 296,
    BOOLEAN_TYPE = 297,
    MATRIX_TYPE = 298,
    VOID_TYPE = 299,
    CHAR_TYPE = 300,
    CONSTANT = 301,
    RETURN = 302,
    ASSINGMENT = 303,
    ADDRESS = 304,
    SEMICOLON = 305,
    COMMA = 306,
    IDENTIFIER = 307
  };
#endif
/* Tokens.  */
#define LITERAL_INT 258
#define LITERAL_FLOAT 259
#define LITERAL_DOUBLE 260
#define LITERAL_CHAR 261
#define LITERAL_STRING 262
#define PLUS_OP 263
#define SUB_OP 264
#define DIV_OP 265
#define EOL 266
#define MOD_OP 267
#define FACT_OP 268
#define STAR 269
#define INC_OP 270
#define DEC_OP 271
#define TRUE_VAL 272
#define FALSE_VAL 273
#define AND_OP 274
#define OR_OP 275
#define S_OP 276
#define SE_OP 277
#define G_OP 278
#define GE_OP 279
#define EQ_OP 280
#define L_PARENTHESIS 281
#define R_PARENTHESIS 282
#define L_KEY 283
#define R_KEY 284
#define L_BRACKET 285
#define R_BRACKET 286
#define IF_STM 287
#define ELSE_STM 288
#define ELSE_IF_STM 289
#define FOR_STM 290
#define DO_STM 291
#define WHILE_STM 292
#define INT_TYPE 293
#define FLOAT_TYPE 294
#define DOUBLE_TYPE 295
#define STRING_TYPE 296
#define BOOLEAN_TYPE 297
#define MATRIX_TYPE 298
#define VOID_TYPE 299
#define CHAR_TYPE 300
#define CONSTANT 301
#define RETURN 302
#define ASSINGMENT 303
#define ADDRESS 304
#define SEMICOLON 305
#define COMMA 306
#define IDENTIFIER 307

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
