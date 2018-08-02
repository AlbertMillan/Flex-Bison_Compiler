%{
	#include <math.h>
	#include <stdio.h>
	#include <stdlib.h>
	#include <iostream>
	#include "SyntaxTree/SyntaxTree.hpp"
	int yylex (void);
	void yyerror (char const *);
%}

%define api.value.type {void *}

%token NAME COLON RIGHT_ARROW LEFT_BRACE RIGHT_BRACE SEMICOLON

%start input


%%

input:
	NAME COLON RIGHT_ARROW LEFT_BRACE statements RIGHT_BRACE 
	| %empty

statements:
	statements statement 										{}
	| %empty

statement:
	NAME SEMICOLON												{ std::cout << "";}

name:
	name 														{}

%%

std::unique_ptr<compiler::SyntaxTree> root();

void yyerror(char const *x)
{
	printf("Error %s\n", x);
	exit(1);
}