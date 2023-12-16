#include <stdio.h>

extern int add_num(int x, int y, int z);

int main(){
    int x = 3;
    int y  = 4;
    int z = 5;
    int result = add_num(x, y, z);
    printf("res = %d\n", result);
    return 0;
}