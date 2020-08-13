#include <stdio.h>

long long int test(char *c1);

int main(void)
{
    char c1[] = "678";
    long long int result = test(c1);
    printf("Result: %lld\n", result);
    return 0;
}


