#include <stdio.h>

#include <fcntl.h>
#include <unistd.h>

int main() {
    int ifd = open("/etc/passwd", O_RDONLY);
    int ofd = open("out/saida.txt", O_CREAT | O_TRUNC | O_WRONLY, 0666);
    int efd = open("out/erros.txt", O_CREAT | O_TRUNC | O_WRONLY, 0666);

    printf("ifd = %d\n", ifd);
    printf("ofd = %d\n", ofd);
    printf("efd = %d\n", efd);

    return 1;
}
