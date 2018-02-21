%{
#include <string.h>
int colunas=1;
int linhas=1;
int totchar=0;
int comentline,comentcollumn;
char *nome;
int inval=0;
int imprime=0;
%}
text [a-zA-Z]
endOfWord ("\n"|"\t"|"\r"|"\f"|"\\"|"\r""\n"|[\\"])
string .*\"
reserved null|"--"|"++"|Integer|System|abstract|assert|break|byte|case|catch|char|const|continue|default|enum|extends|final|finally|float|for|goto|implements|import|instanceof|interface|long|native|new|package|private|protected|short|strictfp|super|switch|synchronized|this|throw|throws|transient|try|volatile
%X COMENT
%X STRING
%X COMENT2
%%
"/*"						{BEGIN COMENT;comentline=linhas;comentcollumn=colunas;colunas+=yyleng;}
<COMENT>"\n"|"\r"|"\r""\n" 	{linhas+=1;colunas=1;}	
<COMENT><<EOF>>				{printf("Line %d, col %d: unterminated comment\n",comentline,comentcollumn);return 0;}
<COMENT>"*/"				{BEGIN 0;colunas+=yyleng;}
<COMENT>"\t"|"\f"			{colunas+=1;}
<COMENT>.					{colunas+=yyleng;}

"//"						{BEGIN COMENT2;comentline=linhas;comentcollumn=colunas;colunas+=2;}
<COMENT2>"\n"|"\r"|"\r""\n"	{BEGIN 0;linhas+=1;colunas=1;}
<COMENT2>.					{colunas+=yyleng;}

\"							{nome=yytext;inval=0;BEGIN STRING;comentline=linhas;comentcollumn=colunas;colunas+=yyleng;}
<STRING>\"					{BEGIN 0;if(inval==0){if(imprime==1){printf("STRLIT(%s)\n",nome);};};colunas+=yyleng;}
<STRING>\\n|\\r|\\t|\\f|\\\\|\\\" {colunas+=yyleng;}
<STRING>\\.|\\					{inval=1;printf("Line %d, col %d: invalid escape sequence (%s)\n",linhas,colunas,yytext);colunas+=yyleng;}
<STRING>\n|\r|(\r\n)	{BEGIN 0;printf("Line %d, col %d: unterminated string literal\n",comentline,comentcollumn);linhas+=1;colunas=1;}
<STRING><<EOF>>			{printf("Line %d, col %d: unterminated string literal\n",comentline,comentcollumn);return 0;}
<STRING>.				{colunas+=yyleng;}

boolean 					{if(imprime==1){printf("BOOL\n");};colunas+=yyleng;}
true|false  				{if(imprime==1){printf("BOOLLIT(%s)\n",yytext);};colunas+=yyleng;}
class 			 			{if(imprime==1){printf("CLASS\n");};colunas+=yyleng;}
do 			    			{if(imprime==1){printf("DO\n");};colunas+=yyleng;}	
double 						{if(imprime==1){printf("DOUBLE\n");};colunas+=yyleng;}
else 			 			{if(imprime==1){printf("ELSE\n");};colunas+=yyleng;}
if 			 				{if(imprime==1){printf("IF\n");};colunas+=yyleng;}
int			 				{if(imprime==1){printf("INT\n");};colunas+=yyleng;}
"."length	 				{if(imprime==1){printf("DOTLENGTH\n");};colunas+=yyleng;}
Integer"."parseInt   		{if(imprime==1){printf("PARSEINT\n");};colunas+=yyleng;}
System"."out"."println 		{if(imprime==1){printf("PRINT\n");};colunas+=yyleng;}
public						{if(imprime==1){printf("PUBLIC\n");};colunas+=yyleng;}
return 			 			{if(imprime==1){printf("RETURN\n");};colunas+=yyleng;}
static 			 			{if(imprime==1){printf("STATIC\n");};colunas+=yyleng;}
void 						{if(imprime==1){printf("VOID\n");};colunas+=yyleng;}
while 			 			{if(imprime==1){printf("WHILE\n");};colunas+=yyleng;}
"("			 				{if(imprime==1){printf("OCURV\n");};colunas+=yyleng;}
")"			 				{if(imprime==1){printf("CCURV\n");};colunas+=yyleng;}
"{"			 				{if(imprime==1){printf("OBRACE\n");};colunas+=yyleng;}
"}"	 			 			{if(imprime==1){printf("CBRACE\n");};colunas+=yyleng;}
"["	 			 			{if(imprime==1){printf("OSQUARE\n");};colunas+=yyleng;}
"]"	 			 			{if(imprime==1){printf("CSQUARE\n");};colunas+=yyleng;}
"&&"	 			 		{if(imprime==1){printf("AND\n");};colunas+=yyleng;}
"||"	 			 		{if(imprime==1){printf("OR\n");};colunas+=yyleng;}
"<"	 			 			{if(imprime==1){printf("LT\n");};colunas+=yyleng;}
">"	 			 			{if(imprime==1){printf("GT\n");};colunas+=yyleng;}
"=="	 			 		{if(imprime==1){printf("EQ\n");};colunas+=yyleng;}
"!="	 			 		{if(imprime==1){printf("NEQ\n");};colunas+=yyleng;}
"<="	 			 		{if(imprime==1){printf("LEQ\n");};colunas+=yyleng;}
">="	 			 		{if(imprime==1){printf("GEQ\n");};colunas+=yyleng;}
"+"	 			 			{if(imprime==1){printf("PLUS\n");};colunas+=yyleng;}
"-"	 			 			{if(imprime==1){printf("MINUS\n");};colunas+=yyleng;}
"*"	 			 			{if(imprime==1){printf("STAR\n");};colunas+=yyleng;}
"/"	 			 			{if(imprime==1){printf("DIV\n");};colunas+=yyleng;}
"%"	 			 			{if(imprime==1){printf("MOD\n");};colunas+=yyleng;}
"!"	 			 			{if(imprime==1){printf("NOT\n");};colunas+=yyleng;}
"="	 			 			{if(imprime==1){printf("ASSIGN\n");};colunas+=yyleng;}
"String"					{if(imprime==1){printf("STRING\n");};colunas+=yyleng;}
";"	 			 			{if(imprime==1){printf("SEMI\n");};colunas+=yyleng;}
","	 			 		    {if(imprime==1){printf("COMMA\n");};colunas+=yyleng;}
{reserved}					{if(imprime==1){printf("RESERVED(%s)\n",yytext);};colunas+=yyleng;}
[0-9]("_"*[0-9])*"."[0-9]("_"*[0-9])*(("E"|"e")((("+"|"-")[0-9]|[0-9])("_"*[0-9])*))? 		{if(imprime==1){printf("REALLIT(%s)\n",yytext);};colunas+=yyleng;}
[0-9]("_"*[0-9])*("E"|"e")((("+"|"-")[0-9]|[0-9])("_"*[0-9])*)			{if(imprime==1){printf("REALLIT(%s)\n",yytext);};colunas+=yyleng;}
"."[0-9]("_"*[0-9])*(("E"|"e")((("+"|"-")[0-9]|[0-9])("_"*[0-9])*))? 		{if(imprime==1){printf("REALLIT(%s)\n",yytext);};colunas+=yyleng;}
[0-9]("_"*[0-9])*"."(("E"|"e")((("+"|"-")[0-9]|[0-9])("_"*[0-9])*))*		{if(imprime==1){printf("REALLIT(%s)\n",yytext);};colunas+=yyleng;}
(0|([1-9]([0-9]|("_"*[0-9]))*))	{if(imprime==1){printf("DECLIT(%s)\n",yytext);};colunas+=yyleng;}
({text}|"$"|_)("$"|_|[0-9]|{text})*		{if(imprime==1){printf("ID(%s)\n",yytext);};colunas+=yyleng;}
"\n"|"\r"|"\r""\n"						{linhas+=1;colunas=1;}			
" "*	 			 		{colunas+=yyleng;}
"\t"|"\f"					{colunas+=yyleng;}
.							{printf("Line %d, col %d: illegal character (%s)\n",linhas,colunas,yytext);colunas+=yyleng;}
<<EOF>> 					{return 0;}
%%
int main(int argc, char *argv[])
{
	if(argc>1){
		if(strcmp(argv[1],"-1")==0||strcmp(argv[1],"-l")==0){
			imprime=1;
		}
	}
yylex();
return 0;
}

int yywrap()
{
return 1;
}