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


/* ==== TRANSLATION RULES ====================================================*/
%%
"/*".*."*/" handleComments();

"@"|"#"|"$"|"&"|":"|"?"|"÷"|"π"|"√"|"¶"|"∆"|"%"|"£"|"~" {throwException(yytext); return 0;}

[0-9].[A-Za-z][a-z0-9]* {throwException(yytext); return 0;}

if|then|begin|end|procedure|function generateToken(yytext);

\"(\\.|[^"\\])*\" generateToken(yytext);

[0-9]+ generateToken(yytext);

[0-9]+"."[0-9]* generateToken(yytext);

[A-Za-z][A-Za-z0-9]* generateToken(yytext);

"int"|"float"|"string"|"array" generateToken(yytext);

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
