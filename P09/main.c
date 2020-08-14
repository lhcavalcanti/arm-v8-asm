#include <stdio.h>

long long int test(char *c1, char *c2);

int main(void)
{
    char c1[] = "grnrclszemskvbgcluwtgyvieip";
    char c2[] = "leg";
    long long int result = test(c1, c2);
    printf("Result: %lld\n", result);
    return 0;
}


