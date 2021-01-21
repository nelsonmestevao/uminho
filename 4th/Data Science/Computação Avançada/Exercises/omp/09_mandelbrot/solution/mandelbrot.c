#include <math.h>
#include <omp.h>
#include <stdlib.h>

#include "lib/lodepng.h"
#define WIDTH 1920
#define HEIGHT 1080
#define MAX_ITER 8000
#define X_MIN -2.5
#define X_MAX 1.5
#define PI 3.1415927
#define OUTPUT "out.png"
int main() {
    double rx, ry, zx, zy, zx2, zy2;
    double starttime;
    int x, y, i, j;
    unsigned char image[WIDTH * HEIGHT * 4];
    const double as = -(HEIGHT / (double)WIDTH) * (X_MAX - X_MIN) / 2,
                 y_min = -as, y_max = as, pw = (X_MAX - X_MIN) / WIDTH,
                 ph = (y_max - y_min) / HEIGHT;
    starttime = omp_get_wtime();
#pragma omp parallel for shared(image) private(x, y, ry, rx, zx, zy, zx2, zy2, \
                                               i)
    for (j = 0; j < HEIGHT * WIDTH; j++) {
        x = j % WIDTH;
        y = j / WIDTH;
        ry = y_min + y * ph;
        rx = X_MIN + x * pw;
        zx = 0.0;
        zy = 0.0;
        zx2 = 0.0;
        zy2 = 0.0;
        for (i = 0; i < MAX_ITER && ((zx2 + zy2) < 4); i++) {
            zy = 2 * zx * zy + ry;
            zx = zx2 - zy2 + rx;
            zx2 = zx * zx;
            zy2 = zy * zy;
        }
        image[j * 4] = 255 - (cos(i * PI / (double)MAX_ITER) + 1) / 2 * 255;
        image[j * 4 + 1] = 255 - (sin(i * PI / (double)MAX_ITER) + 1) / 3 * 255;
        image[j * 4 + 2] = 255 - (i / (double)MAX_ITER) * 255;
        image[j * 4 + 3] = 255;
    }
    printf("Calculation took %lf seconds using %d threads.\n",
           (omp_get_wtime() - starttime), omp_get_max_threads());
    lodepng_encode32_file(OUTPUT, image, WIDTH, HEIGHT);
    return 0;
}
