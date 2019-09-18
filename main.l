/*==== DECLARATIONS ==========================================================*/
%{ 
  #include <math.h>
  int count = 0; 

  void generateToken(char expression[]) {
    printf("\nGenerated token: %s\n", expression);
    printf("Press Enter to ask for another token...\n");
    getchar();
  }

  void handleComments() {
    printf("\n");
  }

  void throwException(char expression[]) {
    printf("\nUnknown expression: %s\n", expression);
  }

  
  

%}

comments "/*".*."*/"

errorSymbols "@"|"#"|"$"|"&"|":"|"?"|"÷"|"π"|"√"|"¶"|"∆"|"%"|"£"|"~"

variableError [0-9].[A-Za-z][a-z0-9]*

reservedWords if|then|function

strings \"(\\.|[^"\\])*\"

integer [0-9]+

float [0-9]+"."[0-9]+

nameVariables [A-Za-z]*

types [int|float|string|array]

/* ==== TRANSLATION RULES ====================================================*/
%%
{comments} handleComments();

{errorSymbols} {throwException(yytext); return 0;}

{variableError} {throwException(yytext); return 0;}

{reservedWords} generateToken(yytext);

{strings} generateToken(yytext);

{integer} generateToken(yytext);

{float} generateToken(yytext);

{nameVariables} generateToken(yytext);

{types} generateToken(yytext);

"+"|"-"|"*"|"/"|"!="|"++"|"--"|"=="|"="|">="|">"|"<="|"<" generateToken(yytext);

"{"|"}"|"("|")"|","|"''"|";"|":" generateToken(yytext);

\n    {return 0;} 
%%

/* ==== AUXILIARY FUNCTIONS ====================================================*/
int yywrap(){} 
int main(){ 
  
  printf("Write your code then press ENTER to start to generate your tokens\n");
  yylex(); 

  return 0; 
}
