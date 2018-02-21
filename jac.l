%{
#include <stdio.h>
#include <string.h>
#include <string.h>

int flag = 1;
int linha = 1;
int coluna = 1;
int linhaColuna = 0;
int inicioComentario = 0;
int stringValida,caracterInvalido;
char *auxiliar = NULL;
char *aux;
char *string;
%}


numeros 					[0-9]*
tudo						.

%X COM
%X COM2
%X ERRO
%x STRING1

%%


[0-9]("_"*[0-9])*"."[0-9]("_"*[0-9])*[eE]([+-]{0,1})[0-9]("_"*[0-9])* {coluna+=yyleng;if(flag == 0){ printf("REALLIT(%s)\n",yytext);}}
[0-9]("_"*[0-9])*"."[eE]([+-]{0,1})[0-9]("_"*[0-9])* {coluna+=yyleng;if(flag == 0){ printf("REALLIT(%s)\n",yytext);}}
[0-9]("_"*[0-9])*"."[0-9]("_"*[0-9])*	{coluna+=yyleng;if(flag == 0){ printf("REALLIT(%s)\n",yytext);}}
[0-9]("_"*[0-9])*"." {coluna+=yyleng;if(flag == 0){ printf("REALLIT(%s)\n",yytext);}}
"."[0-9]("_"*[0-9])*[eE]([+-]{0,1})[0-9]("_"*[0-9])* {coluna+=yyleng;if(flag == 0){ printf("REALLIT(%s)\n",yytext);}}
"."[0-9]("_"*[0-9])* {coluna+=yyleng;if(flag == 0){ printf("REALLIT(%s)\n",yytext);}}
[0-9]("_"*[0-9])*[eE]([+-]{0,1})[0-9]("_"*[0-9])* {coluna+=yyleng;if(flag == 0){ printf("REALLIT(%s)\n",yytext);}}
0|[1-9]("_"*[0-9])*            													{coluna+=yyleng;if(flag == 0){ printf("DECLIT(%s)\n",yytext);}}


boolean					    {coluna+=yyleng;if(flag == 0){ printf("BOOL\n");}}
true|false					{coluna+=yyleng;if(flag == 0){ printf("BOOLLIT(%s)\n",yytext);}}
class						{coluna+=yyleng;if(flag == 0){ printf("CLASS\n");}}
do							{coluna+=yyleng;if(flag == 0){ printf("DO\n");}}
"."length					{coluna+=yyleng;if(flag == 0){ printf("DOTLENGTH\n");}}
double						{coluna+=yyleng;if(flag == 0){ printf("DOUBLE\n");}}
else						{coluna+=yyleng;if(flag == 0){ printf("ELSE\n");}}
if							{coluna+=yyleng;if(flag == 0){ printf("IF\n");}}
int							{coluna+=yyleng;if(flag == 0){ printf("INT\n");}}
Integer"."parseInt			{coluna+=yyleng;if(flag == 0){ printf("PARSEINT\n");}}
System"."out"."println		{coluna+=yyleng;if(flag == 0){ printf("PRINT\n");}}
String 						{coluna+=yyleng;if(flag == 0){ printf("STRING\n");}}
void 						{coluna+=yyleng;if(flag == 0){ printf("VOID\n");}}
public						{coluna+=yyleng;if(flag == 0){ printf("PUBLIC\n");}}
static						{coluna+=yyleng;if(flag == 0){ printf("STATIC\n");}}
while 						{coluna+=yyleng;if(flag == 0){ printf("WHILE\n");}}
return						{coluna+=yyleng;if(flag == 0){ printf("RETURN\n");}}
"(" 						{coluna+=yyleng;if(flag == 0){ printf("OCURV\n");}}
")" 						{coluna+=yyleng;if(flag == 0){ printf("CCURV\n");}}
"{" 						{coluna+=yyleng;if(flag == 0){ printf("OBRACE\n");}}
"}" 						{coluna+=yyleng;if(flag == 0){ printf("CBRACE\n");}}
"[" 						{coluna+=yyleng;if(flag == 0){ printf("OSQUARE\n");}}
"]" 						{coluna+=yyleng;if(flag == 0){ printf("CSQUARE\n");}}
"&&" 						{coluna+=yyleng;if(flag == 0){ printf("AND\n");}}
"||" 						{coluna+=yyleng;if(flag == 0){ printf("OR\n");}}
"<" 						{coluna+=yyleng;if(flag == 0){ printf("LT\n");}}
">" 						{coluna+=yyleng;if(flag == 0){ printf("GT\n");}}
"==" 						{coluna+=yyleng;if(flag == 0){ printf("EQ\n");}}
"!=" 						{coluna+=yyleng;if(flag == 0){ printf("NEQ\n");}}
"<=" 						{coluna+=yyleng;if(flag == 0){ printf("LEQ\n");}}
">=" 						{coluna+=yyleng;if(flag == 0){ printf("GEQ\n");}}
"+" 						{coluna+=yyleng;if(flag == 0){ printf("PLUS\n");}}
"-" 						{coluna+=yyleng;if(flag == 0){ printf("MINUS\n");}}
"*"							{coluna+=yyleng;if(flag == 0){ printf("STAR\n");}}
"/"							{coluna+=yyleng;if(flag == 0){ printf("DIV\n");}}
"%"							{coluna+=yyleng;if(flag == 0){ printf("MOD\n");}}
"!"							{coluna+=yyleng;if(flag == 0){ printf("NOT\n");}}
"="							{coluna+=yyleng;if(flag == 0){ printf("ASSIGN\n");}}
";"							{coluna+=yyleng;if(flag == 0){ printf("SEMI\n");}}
","							{coluna+=yyleng;if(flag == 0){ printf("COMMA\n");}}

"++"						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
"--"						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
null   						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
System						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
Integer 					{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
abstract					{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
assert						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
break						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
byte						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
case						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
catch						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
char						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
const 						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
continue					{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
default						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
enum						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
extends 					{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
final 						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
finally 					{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
float 						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
for 						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
goto						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
implements 					{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
import						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
instanceof					{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
interface					{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
long						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
native						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
new							{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
package						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
private						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
protected					{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
short						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
super						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
switch						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
synchronized				{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
this						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
throw						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
throws						{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
transient					{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
try							{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
volatile					{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}
strictfp					{coluna+=yyleng;if(flag == 0){ printf("RESERVED(%s)\n",yytext);}}

\n|\r\n|\r					{linha++;coluna = 1;}
[ \f]						{coluna+=yyleng;}
[\t]						{coluna+=yyleng;}
[a-zA-Z_$][a-zA-Z0-9_$]*				{coluna+=yyleng;if(flag == 0){ printf("ID(%s)\n",yytext);}}

"/*"        {linhaColuna=linha;inicioComentario = coluna;coluna+=yyleng; BEGIN COM;}
<COM>(\r|\n|(\r\n))	{linha++;coluna=1;}
<COM><<EOF>> {printf("Line %d, col %d: unterminated comment\n",linhaColuna,inicioComentario); BEGIN 0;}
<COM>"*/"   {coluna+=yyleng;BEGIN 0;}
<COM>.      {coluna+=yyleng;} 


"//"        {BEGIN COM2;}
<COM2>(\n|\r|(\r\n))   {linha++;coluna=1; BEGIN 0;}
<COM2><<EOF>> {BEGIN 0;}
<COM2>.        {;}

\"		{linhaColuna=linha;inicioComentario = coluna;coluna+=yyleng;BEGIN STRING1;stringValida=0;string = yytext;}
<STRING1>\"		{if(flag==0 && stringValida == 0 && caracterInvalido == 0){printf("STRLIT(%s)\n",string);} caracterInvalido=0; BEGIN 0;stringValida=0;coluna+=yyleng;}
<STRING1>\\\"|\\r|\\t|\\n|\\f|\\\\	{coluna+=yyleng;}
<STRING1>\\|\\.			{printf("Line %d, col %d: invalid escape sequence (%s)\n",linhaColuna,coluna,yytext); coluna+=yyleng;caracterInvalido = 1;}
<STRING1>\r|\n|(\r\n)  {coluna=1;linha++;printf("Line %d, col %d: unterminated string literal\n",linhaColuna,inicioComentario); BEGIN 0; stringValida=0;caracterInvalido=0;}
<STRING1>. {coluna+=yyleng;}
<STRING1><<EOF>> {printf("Line %d, col %d: unterminated string literal\n",linhaColuna,inicioComentario); BEGIN 0; stringValida=0;caracterInvalido=0;}


.	{printf("Line %d, col %d: illegal character (%s)\n",linha,coluna,yytext);coluna+=yyleng;}


%%


int main(int argc, char *argv[])
{	
	if(argc>1){
		if(strcmp(argv[1],"-l")==0  ||  strcmp(argv[1],"-1")==0){ flag=0;}	
	}
	yylex();
	return 0;
}

int yywrap()
{
	return 1;
}