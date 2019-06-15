#include <stdio.h>
#include <stdlib.h>

#include <sys/types.h>
#include <unistd.h>

int main() {
    for (int i = 1; i <= 10; i++) {
        printf("PID %d: trabalhou %d vezes\n", getpid(), i);
        sleep(1);
    }
}
