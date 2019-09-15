
%{ 
#include <math.h>
int count = 0; 
%} 
  
DIGIT [0-9]
ID [A-Za-z][a-z0-9]*

%% 

{DIGIT}+    { printf("An integer: %s (%d)\n", yytext, atoi( yytext )); }

{DIGIT}+"."{DIGIT}*     { printf( "A float: %s (%g)\n", yytext, atof( yytext ) ); }

if|then|begin|end|procedure|function    { printf( "A keyword: %s\n", yytext ); }

{ID}    { printf("An identifier: %s\n", yytext ); }

"int"|float|string|array { printf("Tipo de variável: %s\n", yytext); }

"+"|"-"|"*"|"/"|"!="|"++"|"--"|"=="|">="|">"|"<="|"<" { printf( "An operator: %s\n", yytext ); }

"{"|"}"|"("|")"|","|"''" { printf( "An special symbol: %s\n", yytext ); }

. { printf("Erro: %s\n", yytext); }


\n    {return 0;} 
%% 
  
int yywrap(){} 
int main(){ 

yylex(); 

return 0; 
} 