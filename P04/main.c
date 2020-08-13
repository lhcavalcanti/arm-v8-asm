#include <stdio.h>

void test(long long int *num);

int main(void)
{
    long long int num = 0x0F0F0F0F0F0F0F0F;

    printf("BEFORE\n");
    printf("num = %016llX\n", num);
    test(&num);
    printf("AFTER\n");
    printf("num = %016llX\n", num);
    return 0;
}


