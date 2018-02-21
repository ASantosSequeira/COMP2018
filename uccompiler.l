numero				[0-9]
ID					[A-Za-z_]+[A-Za-z_0-9]*
CHARLIT				'([^\n\']){1}'
CHARLIT2			'[\n\t\\\'\"(\[0-7]+[0-7]?[0-7]?]'
letra				[A-Za-z]
letraMinuscula      [a-z]
letraMaiuscula		[A-Z]+
%%
{numero}+["."](({numero})*)?([eE]("+"|"-")?{numero}+)?		{printf("REALLIT(%s)\n",yytext);}
["."]({numero})+([eE]("+"|"-")?{numero}+)?					{printf("REALLIT(%s)\n",yytext);}
{numero}+											{printf("INTLIT(%s)\n",yytext);}
{numero}+([eE]("+"|"-")?{numero}+)?					{printf("REALLIT(%s)\n",yytext);}
char										{printf("CHAR\n");}
else										{printf("ELSE\n");}
while										{printf("WHILE\n");}
if											{printf("IF\n");}
int 										{printf("INT\n");}
short										{printf("SHORT\n");}
double										{printf("DOUBLE\n");}
return										{printf("RETURN\n");}
void										{printf("VOID\n");}
"&"											{printf("BITWISEAND\n");}
"|"											{printf("BITWISEOR\n");}
"^"											{printf("BITWISEXOR\n");}
"&&"										{printf("AND\n");}
"="											{printf("ASSIGN\n");}
"*"											{printf("MUL\n");}
","											{printf("COMMA\n");}
"%"											{printf("MOD\n");}
"/"											{printf("DIV\n");}
"=="										{printf("EQ\n");}
">="										{printf("GE\n");}
">"											{printf("GT\n");}
"{"											{printf("LBRACE\n");}
"<="										{printf("LE\n");}
"("											{printf("LPAR\n");}
"<"											{printf("LT\n");}
"-"											{printf("MINUS\n");}
"!="										{printf("NE\n");}
"!"											{printf("NOT\n");}
"||"										{printf("OR\n");}
"+"											{printf("PLUS\n");}
"}"											{printf("RBRACE\n");}
")"											{printf("RPAR\n");}
";"											{printf("SEMI\n");}
"["											{printf("RESERVED(%s)\n",yytext);}
"]"											{printf("RESERVED(%s)\n",yytext);}
"++"										{printf("RESERVED(%s)\n",yytext);}
"--"										{printf("RESERVED(%s)\n",yytext);}
auto										{printf("RESERVED(%s)\n",yytext);}
break										{printf("RESERVED(%s)\n",yytext);}
case										{printf("RESERVED(%s)\n",yytext);}
const										{printf("RESERVED(%s)\n",yytext);}
continue									{printf("RESERVED(%s)\n",yytext);}
default										{printf("RESERVED(%s)\n",yytext);}
do 											{printf("RESERVED(%s)\n",yytext);}
long 										{printf("RESERVED(%s)\n",yytext);}
register									{printf("RESERVED(%s)\n",yytext);}
signed										{printf("RESERVED(%s)\n",yytext);}
sizeof										{printf("RESERVED(%s)\n",yytext);}
static										{printf("RESERVED(%s)\n",yytext);}
struct										{printf("RESERVED(%s)\n",yytext);}
switch										{printf("RESERVED(%s)\n",yytext);}
typedef										{printf("RESERVED(%s)\n",yytext);}
union										{printf("RESERVED(%s)\n",yytext);}
unsigned 									{printf("RESERVED(%s)\n",yytext);}
volatile									{printf("RESERVED(%s)\n",yytext);}
enum										{printf("RESERVED(%s)\n",yytext);}
extern 										{printf("RESERVED(%s)\n",yytext);}
float 										{printf("RESERVED(%s)\n",yytext);}
for											{printf("RESERVED(%s)\n",yytext);}
goto										{printf("RESERVED(%s)\n",yytext);}
{CHARLIT2}									{printf("CHRLIT('%c')\n",yytext[1]);}
{CHARLIT}									{printf("CHRLIT('%c')\n",yytext[1]);}
{ID}										{printf("ID(%s)\n",yytext);}
[\n\r\t\ ] 											{;}
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

