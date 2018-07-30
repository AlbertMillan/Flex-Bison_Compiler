#include <iostream>

extern "C"
{
	int yyparse();
	void yyerror(const char *);
	int yylex();
}

extern int yylineno;


int main()
{
	int result = yyparse();
	if(result == 0)
		std::cout << "The input is valid" << std::endl;
	else
		std::cout << "Invalid input" << std::endl;
	std::cout << "The number of lines is: " << yylineno << std::endl;
	return result;
}