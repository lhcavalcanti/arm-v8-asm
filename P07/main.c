#include <stdio.h>

char test(char *c1, char *c2);

int main(void)
{
    char c1[] = "GOTICO"; // Pontuacao: 10
    char c2[] = "ARMASW"; // Pontuacao: 11
    char result = test(c1, c2);
    printf("Count: %c\n", result);
    return 0;
}


