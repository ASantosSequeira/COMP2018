numero				[0-9]
ID					[A-Za-z_]+[A-Za-z_0-9]*
CHARLIT				^[\n\"]
letra				[A-Za-z]
letraMinuscula      [a-z]
letraMaiuscula		[A-Z]+
%%
{numero}+["."](({numero})*)?([eE]("+"|"-")?{numero}+)?		{printf("REALLIT(%s)\n",yytext);}
["."]({numero})+([eE]("+"|"-")?{numero}+)?					{printf("REALLIT(%s)\n",yytext);}
{numero}+											{printf("INTLIT(%s)\n",yytext);}
{numero}+([eE]("+"|"-")?{numero}+)?					{printf("REALLIT(%s)\n",yytext);}


{CHARLIT}									{printf("CHRLIT('%c')\n",yytext[0]);}



char										{printf("CHAR\n");}
else										{printf("ELSE\n");}
while										{printf("WHILE\n");}
if											{printf("IF\n");}
int 										{printf("INT\n");}
short										{printf("SHORT\n");}
double										{printf("DOUBLE\n");}
return										{printf("RETURN\n");}
void										{printf("VOID\n");}
&											{printf("BITWISEAND\n");}
"|"											{printf("BITWISEOR\n");}
"^"											{printf("BITWISEXOR\n");}
&&											{printf("AND\n");}
=											{printf("ASSIGN\n");}
"*"											{printf("MUL\n");}
,											{printf("COMMA\n");}
"/"											{printf("DIV\n");}
==											{printf("EQ\n");}
>=											{printf("GE\n");}
>											{printf("GT\n");}
"{"											{printf("LBRACE\n");}
"<="										{printf("LE\n");}
"("											{printf("LPAR\n");}
"<"											{printf("LT\n");}
"-"											{printf("MINUS\n");}
%											{printf("MOD\n");}
!=											{printf("NE\n");}
!											{printf("NOT\n");}
"||"										{printf("OR\n");}
"+"											{printf("PLUS\n");}
"}"											{printf("RBRACE\n");}
")"											{printf("RPAR\n");}
;											{printf("SEMI\n");}
"["											{printf("RESERVED\n");}
"]"											{printf("RESERVED\n");}
"++"										{printf("RESERVED\n");}
"--"										{printf("RESERVED\n");}
auto										{printf("RESERVED\n");}
break										{printf("RESERVED\n");}
case										{printf("RESERVED\n");}
const										{printf("RESERVED\n");}
continue									{printf("RESERVED\n");}
default										{printf("RESERVED\n");}
do 											{printf("RESERVED\n");}
long 										{printf("RESERVED\n");}
register									{printf("RESERVED\n");}
signed										{printf("RESERVED\n");}
sizeof										{printf("RESERVED\n");}
static										{printf("RESERVED\n");}
struct										{printf("RESERVED\n");}
switch										{printf("RESERVED\n");}
typedef										{printf("RESERVED\n");}
union										{printf("RESERVED\n");}
unsigned 									{printf("RESERVED\n");}
volatile									{printf("RESERVED\n");}
enum										{printf("RESERVED\n");}
extern 										{printf("RESERVED\n");}
float 										{printf("RESERVED\n");}
for											{printf("RESERVED\n");}
goto										{printf("RESERVED\n");}
{ID}										{printf("ID(%s)\n",yytext);}
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

