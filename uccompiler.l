
%{
	int linha=0;
	int coluna = 0;
	int flag = 0;
%}


numero				[0-9]
ID					[A-Za-z_]+[A-Za-z_0-9]*
CHARLIT				^[\n\"]
letra				[A-Za-z]
letraMinuscula      [a-z]
letraMaiuscula		[A-Z]+
%%
{numero}+["."](({numero})*)?([eE]("+"|"-")?{numero}+)?		{printf("REALLIT(%s)\n",yytext);linha+= yyleng;}
["."]({numero})+([eE]("+"|"-")?{numero}+)?					{printf("REALLIT(%s)\n",yytext);linha+= yyleng;}
{numero}+											{printf("INTLIT(%s)\n",yytext);linha+= yyleng;}
{numero}+([eE]("+"|"-")?{numero}+)?					{printf("REALLIT(%s)\n",yytext);linha+= yyleng;}



char										{printf("CHAR\n");linha+= yyleng;}
else										{printf("ELSE\n");linha+= yyleng;}
while										{printf("WHILE\n");linha+=yyleng;}
if											{printf("IF\n");linha+= yyleng;}
int 										{printf("INT\n");linha+= yyleng;}
short										{printf("SHORT\n");linha+= yyleng;}
double										{printf("DOUBLE\n");linha+= yyleng;}
return										{printf("RETURN\n");linha+= yyleng;}
void										{printf("VOID\n");linha+= yyleng;}
&											{printf("BITWISEAND\n");linha+= yyleng;}
"|"											{printf("BITWISEOR\n");linha+= yyleng;}
"^"											{printf("BITWISEXOR\n");linha+= yyleng;}
&&											{printf("AND\n");linha+= yyleng;}
=											{printf("ASSIGN\n");linha+= yyleng;}
"*"											{printf("MUL\n");linha+= yyleng;}
,											{printf("COMMA\n");linha+= yyleng;}
"/"											{printf("DIV\n");linha+= yyleng;}
==											{printf("EQ\n");linha+= yyleng;}
>=											{printf("GE\n");linha+= yyleng;}
>											{printf("GT\n");linha+= yyleng;}
"{"											{printf("LBRACE\n");linha+= yyleng;}
"<="										{printf("LE\n");linha+= yyleng;}
"("											{printf("LPAR\n");linha+= yyleng;}
"<"											{printf("LT\n");linha+= yyleng;}
"-"											{printf("MINUS\n");linha+= yyleng;}
%											{printf("MOD\n");linha+= yyleng;}
!=											{printf("NE\n");linha+= yyleng;}
!											{printf("NOT\n");linha+= yyleng;}
"||"										{printf("OR\n");linha+= yyleng;}
"+"											{printf("PLUS\n");linha+= yyleng;}
"}"											{printf("RBRACE\n");linha+= yyleng;}
")"											{printf("RPAR\n");linha+= yyleng;}
;											{printf("SEMI\n");linha+= yyleng;}
"["											{printf("RESERVED\n");linha+= yyleng;}
"]"											{printf("RESERVED\n");linha+= yyleng;}
"++"										{printf("RESERVED\n");linha+= yyleng;}
"--"										{printf("RESERVED\n");linha+= yyleng;}
auto										{printf("RESERVED\n");linha+= yyleng;}
break										{printf("RESERVED\n");linha+= yyleng;}
case										{printf("RESERVED\n");linha+= yyleng;}
const										{printf("RESERVED\n");linha+= yyleng;}
continue									{printf("RESERVED\n");linha+= yyleng;}
default										{printf("RESERVED\n");linha+= yyleng;}
do 											{printf("RESERVED\n");linha+= yyleng;}
long 										{printf("RESERVED\n");linha+= yyleng;}
register									{printf("RESERVED\n");linha+= yyleng;}
signed										{printf("RESERVED\n");linha+= yyleng;}
sizeof										{printf("RESERVED\n");linha+= yyleng;}
static										{printf("RESERVED\n");linha+= yyleng;}
struct										{printf("RESERVED\n");linha+= yyleng;}
switch										{printf("RESERVED\n");linha+= yyleng;}
typedef										{printf("RESERVED\n");linha+= yyleng;}
union										{printf("RESERVED\n");linha+= yyleng;}
unsigned 									{printf("RESERVED\n");linha+= yyleng;}
volatile									{printf("RESERVED\n");linha+= yyleng;}
enum										{printf("RESERVED\n");linha+= yyleng;}
extern 										{printf("RESERVED\n");linha+= yyleng;}
float 										{printf("RESERVED\n");linha+= yyleng;}
for											{printf("RESERVED\n");linha+= yyleng;}
goto										{printf("RESERVED\n");linha+= yyleng;}
inline										{printf("RESERVED\n");linha+= yyleng;}
restrict									{printf("RESERVED\n");linha+= yyleng;}
_Bool										{printf("RESERVED\n");linha+= yyleng;}
_Complex									{printf("RESERVED\n");linha+= yyleng;}
_Imaginary									{printf("RESERVED\n");linha+= yyleng;}


{ID}										{printf("ID(%s)\n",yytext);linha+= yyleng;}
" "											{linha++;}
\r  										{linha++;}		
\n											{printf("linha:%d,coluna:%d\n",linha,coluna);linha = 0; coluna +=1;}
										
.											{;}

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

