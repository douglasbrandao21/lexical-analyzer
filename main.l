/*==== DECLARATIONS ==========================================================*/
%{
  void generateToken(char expression[]) {
    printf("\nGenerated token: %s\n", expression);
    getchar();
  }

  void ignoreSymbol() {
    printf(" ");
  }

  void throwException(char expression[]) {
    printf("\nUnknown expression: %s\n", expression);
  }
%}

/*The regular expression to get the comments of the input*/
commentsExpression "/*".*."*/"

/*The regular expression used to get illegal symbols of the input*/
illegalSymbolsExpression "@"|"#"|"$"|"?"|"÷"|"π"|"√"|"¶"|"∆"|"£"|"~"

/*The regular expression used to get llegal variable declaration*/
/*Example? int 1a*/
illegalVariablesExpression ([0-9]|{illegalSymbolsExpression})[A-Za-z][A-Za-z0-9]*

/*The regular expression to get reserved words of the input*/
reservedWordsExpression if|else|then|function|for|while|null

/*The regular expression to get the strings of the input*/
stringsExpression (\"(\\.|[^"\\])*\")

/*The regular expression to get integer numbers of the input*/
integersExpression [0-9]+

/*The regular expression to get float numbers of the input*/
floatsExpression [0-9]+"."[0-9]+

/*The regular expression to get valid variables declaration of the input*/
variablesExpresion [A-Za-z][A-Za-z0-9]*

/*The regular expression to get types word of the input*/
typesExpression [int|float|string|array]

/*The regular expression to get operators symbols of the input*/
operatorsExpression "+"|"-"|"*"|"/"|"!="|"++"|"--"|"=="|"="|">="|">"|"<="|"<"|%|"&&"|"||"|"!"

/*The regular expression to get especial symbos of the input*/
symbolsExpression "["|"]"|"{"|"}"|"("|")"|","|"''"|";"|":"

/*The regular expression to get the indent caracteres of the input*/
indentExpression ("\t"|"\n")

/* ==== TRANSLATION RULES ====================================================*/
%%
{commentsExpression} ignoreSymbol();

{illegalSymbolsExpression} {throwException(yytext); return 0;}

{illegalVariablesExpression} {throwException(yytext); return 0;}

{reservedWordsExpression} generateToken(yytext);

{stringsExpression} generateToken(yytext);

{integersExpression} generateToken(yytext);

{floatsExpression} generateToken(yytext);

{variablesExpresion} generateToken(yytext);

{typesExpression} generateToken(yytext);

{operatorsExpression} generateToken(yytext);

{symbolsExpression} generateToken(yytext);

{indentExpression} ignoreSymbol(yytext);
%%

/* ==== AUXILIARY FUNCTIONS ====================================================*/
int yywrap(){} 
int main(){ 
  yylex();

  return 0; 
}
