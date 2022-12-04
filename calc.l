
%{
	#include <stdio.h>
	#include "header.h"
	#include "calc.tab.h"
%}

%option yylineno

D	[0-9]
L	[a-zA-Z_]

%% 

[ \t\r\n]			{}
"affichage"				{ return TOK_AFFICHAGE; }
"="					{ return '=';  }
"*"					{ return '*'; }
"/"					{ return '/'; }
"+"					{ return '+'; }
"-"					{ return '-'; }
"("					{ return '('; }
")"					{ return ')'; }
"^"					{ return '^'; }
[<>!{}]		{ return yytext[0]; }
"et"		{ return TOK_ET; }
"ou"		{ return TOK_OU; }
"si"		{ return TOK_SI; }
"sinon"		{ return TOK_SINON; }
"alorsque"		{ return TOK_ALORSQUE; }

{D}+			{ yylval.args.intv = atoi(yytext);
						return TOK_INTEGER; }

{D}+\.{D}+			{ yylval.args.dblv = atof(yytext);
									return TOK_FLOAT; }

{L}({L}|{D})*		{ yylval.args.ident = strndup(yytext, yyleng);
									return TOK_IDENT; }
 /* [a-zA-Z_][a-zA-Z0-9_]* {} */


 /* comentário */
.					{ printf("Caractère invalide: %c.\n", yytext[0]); }

%%

int yywrap() {
	return 1;
}

int main(int argc, char *argv[]) {
	
	if (argc <= 1) {
		printf("%s [file]\n", argv[0]);
		return 1;
	}

	FILE *f = fopen(argv[1], "r");
	yyin = f;
	yyparse();
	fclose(f);
	return 0;
}

