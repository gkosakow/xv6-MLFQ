#include "types.h"
#include "user.h"

int main(int argc, char *argv[]) {
    int i;
    int x = 0;

    if (argc != 2)
        exit();
    
    for (i = 1; i < atoi(argv[1]); i++)
        x++;
    
    printf(1, "pid(%d): x = %d\n", getpid(), x);
    exit();
}