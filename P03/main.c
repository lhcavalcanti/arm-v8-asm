#include <stdio.h>

void test(long long int *x10, long long int *x11);

int main(void)
{
    long long int x10 = 0x0, x11 = 0xFFFFFFFFFFFFFFFF;

    printf("BEFORE\n");
    printf("x10 = %llx\n", x10);
    printf("x11 = %llx\n", x11);
    test(&x10, &x11);
    printf("AFTER\n");
    printf("x10 = %llx\n", x10);
    printf("x11 = %llx\n", x11);
    return 0;
}


