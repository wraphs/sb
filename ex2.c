#include <stdio.h>

unsigned char rotate_left(unsigned char x, int n)
{
    unsigned char mask = 0x80;
    int ncpy = n;
    while(ncpy!=0)
    {
        mask = (mask | mask/2);
        ncpy--;
    }

    unsigned char temp = (x & mask);
    temp = (temp >> 8-n);
    
    x = (x<<n);
    x = (x | temp);

    return x;
}

int main()
{
    printf("final: %#x\n", rotate_left(0x61, 1));
    printf("final: %#x\n", rotate_left(0x61, 2));
    printf("final: %#x\n", rotate_left(0x61, 7));
}