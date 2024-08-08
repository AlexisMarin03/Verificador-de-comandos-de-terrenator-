%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "proy.tab.h"
%}
DIGIT      [0-9]
INTEGER    {DIGIT}+
FLOAT      {DIGIT}+(\.{DIGIT}+)?

%%
on                      { return STATE; }
off                     { return STATE; }
acelerar                { return ACCELERATE; }
frenar                  { return BRAKE; }
iratras                 { return BACKWARD; }
izquierda               { return LEFT; }
derecha                 { return RIGHT; }
girolateral             { return TURN_LATERAL_SIDE; }
girofrontal             { return TURN_FRONTAL; }
saltar                  { return JUMP; }
bocina                  {yylval.ival = 1; return HORN; }
{INTEGER}               { yylval.ival = atoi(yytext); return INT; }
{FLOAT}                 { yylval.fval = atof(yytext); return FLOAT; }
.|\n                    ;
%%

int yywrap (void) {return 1;}