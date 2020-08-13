#include <stdio.h>

void test(long long int *num);

int main(void)
{
    long long int num = 10;

    printf("BEFORE\n");
    printf("num = %lld\n", num);
    test(&num);
    printf("AFTER Loop\n");
    printf("num = %lld\n", num);
    return 0;
}


