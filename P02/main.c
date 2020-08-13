#include <stdio.h>

void test(long long int *a, long long int *b, long long int *c, long long int *x);

int main(void)
{
    long long int a = 1, b = 2, c = 25, x = 10;
    test(&a, &b, &c, &x);
    printf("x = %lld\n", x);
    return 0;
}
