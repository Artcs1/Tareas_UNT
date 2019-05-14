%{
#include <stdio.h>
#include <stdlib.h>

#define ENTERO 35
#define REAL 1
#define HEXA 2
#define IDENT 3
#define CARACTER 4
#define CADENA 5

#define DO 6
#define ELSE 7
#define IF 8
#define TDAT 9
#define RES 10
#define SUM 11
#define DIV 12
#define MUL 13
#define PARL 14
#define PARR 15
#define CORL 16
#define CORR 17
#define LLAL 18
#define LLAR 19
#define MENR 20
#define MAYR 21
#define IGUA 22
#define PCOM 23
#define FOR 24
#define WHILE 25
#define USING 26
#define NAME 27
#define STD 28
#define MIG 29
#define MAG 30
#define NUM 31
#define PUNTO 32
#define RET 33
#define COMP 34

%}

%option outfile = "Scanner.c"
%option noyywrap
%option yylineno

ignora " "|\t|\n
L [a-zA-Z]
D [[:digit:]]
H [[:digit:]a-fA-F]

%%

"using"         {return(USING);}
"namespace"     {return(NAME);}
"std"           {return(STD);}
"for"           {return(FOR);}
"while"         {return(WHILE);}
"do"			{return(DO);}
"else"			{return(ELSE);}
"if"			{return(IF);}
"return"        {return(RET);}


"int"           {return(TDAT);}
"double"        {return(TDAT);}
"float"         {return(TDAT);} 
"char"          {return(TDAT);}
"string"        {return(TDAT);}
"long"          {return(TDAT);}
"long int"      {return(TDAT);}
"long long int" {return(TDAT);}
"bool"          {return(TDAT);}
"void"          {return(TDAT);}


{ignora}*               		{;}
(-{D}+|{D}+)					{return(ENTERO);}
(-{D}+|{D}+)"."{D}+		        {return(REAL);}
(0x|0X){H}{H}					{return(HEXA);}
\"({L}|{D}|" ")+\"				{return(CADENA);}
{L}({L}|{D}|_)*     			{return(IDENT);}
\'({L}|{D})\'					{return(CARACTER);}				

"-"         {return(RES);}
"+"			{return(SUM);}
"/"         {return(DIV);}
"*"			{return(MUL);}
"("			{return(PARL);}
")"			{return(PARR);}
"["         {return(CORL);}
"]"         {return(CORR);;}
"{"         {return(LLAL);}
"}"         {return(LLAR);}
"<"         {return(MENR);}
">"         {return(MAYR);}
"="			{return(IGUA);}
";"			{return(PCOM);}
"<="        {return(MIG);}
">="        {return(MAG);}
"#"         {return(NUM);}
"."         {return(PUNTO);}
"=="        {return(COMP);}

.			{printf("LINEA %d: ERROR LEXICO\n",yylineno);}

%%

/*
int main()
{
	char NomArch[30];
	int token;
	printf("Ingrese archivo:");
	scanf("%s",NomArch);
	yyin=fopen(NomArch,"rt");
	if (yyin==NULL)
	{
		printf("No se puede abrie el archivo %s",NomArch);	
	}
	else
	{
		while((token=yylex())>0)
		{
            printf("TOKEN = %d    LEXEMA = %s \n",token,yytext);
		}
	}
	fclose(yyin);

	return(0);
}
*/
