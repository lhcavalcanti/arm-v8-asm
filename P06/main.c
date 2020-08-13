#include <stdio.h>

long long int test(char *num);

int main(void)
{
    char c[] = "ABCDEFGHIUEQQO"; // 6 vows
    long long int count = test(c);
    printf("Count: %lld\n", count);
    return 0;
}


