%{
#include<stdio.h>

FILE *filePointer;
%}

%option noyywrap

url     foo


%%

{url}   {
    fprintf(filePointer, "Found URL: %s\n", yytext);
}

.|\n       ;

%%

int main() {
    filePointer = fopen("output.txt", "w");
    if (filePointer == NULL) {
        printf("Error opening the file.\n");
        return 1; // Return an error code
    }

    yylex();

    fclose(filePointer);
    return 0;
}