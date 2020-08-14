#include <stdio.h>

long long int test(char *c1, long long int *base);

int main(void)
{
    char c1[] = "10";
    long long int base = 2;
    long long int result = test(c1, &base);
    printf("Factorion: %lld\n", result);
    return 0;
}


