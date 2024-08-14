#include <stdio.h>
#include <stdlib.h>

int main(int N, int M)
{
    print_array(int N, int M, []p)

    float (*p)[N] [M] = malloc(sizeof *p);
    if (p == 0)
        return -1;
    for (int i = 0; i < N; i++)
        for (int j = 0; j < M; j++)
            (*p) [i] [j] = i + j;
    print_array(N, M, p);
    free(p);

    printf("eee");
}
