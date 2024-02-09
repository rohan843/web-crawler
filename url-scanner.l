%{
#include<stdio.h>

FILE *filePointer;
%}

%option noyywrap

url     (http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?
email   ([a-zA-Z0-9._]+)@(([a-zA-Z0-9-])+\.)+([a-zA-Z]{1,5})

%%

{url}   {
    fprintf(filePointer, "Found URL: %s\n", yytext);
}

{email} {
    fprintf(filePointer, "Found Email: %s\n", yytext);
}

.|\n    ;

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