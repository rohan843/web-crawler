#include <stdio.h>
#include <time.h>

FILE *filePointer = NULL;

#include "lex.yy.c"

int main()
{
    system("curl -so input.txt https://example.com");
    yyrestart(fopen("input.txt", "r"));

    filePointer = fopen("output.txt", "w");
    if (filePointer == NULL)
    {
        printf("Error opening the file.\n");
        return 1; // Return an error code
    }

    time_t currentTime;
    time(&currentTime);
    char *timeString = ctime(&currentTime);

    // Print the current time
    fprintf(filePointer, "Current Time: %s", timeString);

    yylex();

    fclose(filePointer);
    return 0;
}