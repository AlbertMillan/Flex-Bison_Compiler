%option noyywrap
%{
	#include "grammar.tab.h"
	#include "SyntaxTree/SyntaxTree.hpp"
	#include "SyntaxTree/Name.hpp"
%}

alpha		[a-zA-Z]
name		{alpha}([0-9]*{alpha}*)+
whitespace	[ \r\t\v\f ]
linefeed	\n

%%
{name}				{ yylval = reinterpret_cast<void *>(new compiler::Name(yytext)); return NAME; }
":"					{ return COLON; }
";"					{ return SEMICOLON; }
"->"				{ return RIGHT_ARROW; }
"}"					{ return RIGHT_BRACE; }
"{"					{ return LEFT_BRACE;  }
{whitespace}
{linefeed}			++yylineno;
%%
#include <stdio.h>

