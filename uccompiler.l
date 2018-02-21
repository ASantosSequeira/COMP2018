%{
	int linhas = 1;
	int colunas = 1;
	int linhasComent;
	int colunasComent;
%}


numero				[0-9]
ID					[A-Za-z_]+[A-Za-z_0-9]*
CHARLIT				'([^\n\']){1}'
CHARLIT2			'[\n\t\\\'\"(\[0-7]+[0-7]?[0-7]?]'
letra				[A-Za-z]
letraMinuscula      [a-z]
letraMaiuscula		[A-Z]+

/*ACRESCENTADO*/

%X COMENT
%X CHARLIT_ESTADO
%X COMENT2
%%




"/*"														{BEGIN COMENT;linhasComent = linhas;colunasComent = colunas;colunas+= yyleng;}

<COMENT>"\n"|"\r"|"\r""\n" 									{linhas+=1;colunas=1;colunas+= yyleng;}	
<COMENT><<EOF>>												{printf("Line %d, col %d: unterminated comment\n",linhasComent,colunasComent);return 0;}
<COMENT>"*/"												{BEGIN 0;colunas+=yyleng;}
<COMENT>"\t"|"\f"											{colunas+=1;}
<COMENT>.													{colunas+=yyleng;}

"//"														{BEGIN COMENT2;linhasComent = linhas;colunasComent = colunas;colunas+= yyleng;}

<COMENT2>"\n"|"\r"|"\r""\n"									{BEGIN 0;linhas+=1;colunas=1;colunas+= yyleng;}
<COMENT2>.													{colunas+=yyleng;}



{numero}+["."](({numero})*)?([eE]("+"|"-")?{numero}+)?		{printf("REALLIT(%s)\n",yytext);colunas+= yyleng;}
["."]({numero})+([eE]("+"|"-")?{numero}+)?					{printf("REALLIT(%s)\n",yytext);colunas+= yyleng;}
{numero}+													{printf("INTLIT(%s)\n",yytext);colunas+= yyleng;}
{numero}+([eE]("+"|"-")?{numero}+)?							{printf("REALLIT(%s)\n",yytext);colunas+= yyleng;}



char														{printf("CHAR\n");colunas+= yyleng;}
else														{printf("ELSE\n");colunas+= yyleng;}
while														{printf("WHILE\n");colunas+= yyleng;}
if															{printf("IF\n");colunas+= yyleng;}
int 														{printf("INT\n");colunas+= yyleng;}
short														{printf("SHORT\n");colunas+= yyleng;}
double														{printf("DOUBLE\n");colunas+= yyleng;}
return														{printf("RETURN\n");colunas+= yyleng;}
void														{printf("VOID\n");colunas+= yyleng;}
&															{printf("BITWISEAND\n");colunas+= yyleng;}
"|"															{printf("BITWISEOR\n");colunas+= yyleng;}
"^"															{printf("BITWISEXOR\n");colunas+= yyleng;}
&&															{printf("AND\n");colunas+= yyleng;}
=															{printf("ASSIGN\n");colunas+= yyleng;}
"*"											{printf("MUL\n");colunas+= yyleng;}
,											{printf("COMMA\n");colunas+= yyleng;}
%											{printf("MOD\n");colunas+= yyleng;}
"/"											{printf("DIV\n");colunas+= yyleng;}
==											{printf("EQ\n");colunas+= yyleng;}
>=											{printf("GE\n");colunas+= yyleng;}
>											{printf("GT\n");colunas+= yyleng;}
"{"											{printf("LBRACE\n");colunas+= yyleng;}
"<="										{printf("LE\n");colunas+= yyleng;}
"("											{printf("LPAR\n");colunas+= yyleng;}
"<"											{printf("LT\n");colunas+= yyleng;}
"-"											{printf("MINUS\n");colunas+= yyleng;}
!=											{printf("NE\n");colunas+= yyleng;}
!											{printf("NOT\n");colunas+= yyleng;}
"||"										{printf("OR\n");colunas+= yyleng;}
"+"											{printf("PLUS\n");colunas+= yyleng;}
"}"											{printf("RBRACE\n");colunas+= yyleng;}
")"											{printf("RPAR\n");colunas+= yyleng;}
;											{printf("SEMI\n");colunas+= yyleng;}
"["											{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
"]"											{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
"++"										{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
"--"										{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
auto										{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
break										{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
case										{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
const										{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
continue									{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
default										{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
do 											{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
long 										{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
register									{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
signed										{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
sizeof										{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
static										{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
struct										{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
switch										{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
typedef										{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
union										{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
unsigned 									{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
volatile									{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
enum										{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
extern 										{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
float 										{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
for											{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
goto										{printf("RESERVED(%s)\n",yytext);colunas+= yyleng;}
{CHARLIT2}									{printf("CHRLIT('%c')\n",yytext[1]);}
{CHARLIT}									{printf("CHRLIT('%c')\n",yytext[1]);}
{ID}										{printf("ID(%s)\n",yytext);colunas+= yyleng;}
"\n"|"\r"|"\r""\n"							{linhas+=1;colunas=1;printf("linhas:%d,colunas:%d",linhas,colunas);}			
" "*	 			 						{colunas+=yyleng;}
"\t"|"\f"									{colunas+=yyleng;}
.											{printf("Line %d, col %d: illegal character (%s)\n",linhas,colunas,yytext);colunas+=yyleng;}


%%
int main()
{
yylex();
return 0;
}

int yywrap()
{
return 1;
}

