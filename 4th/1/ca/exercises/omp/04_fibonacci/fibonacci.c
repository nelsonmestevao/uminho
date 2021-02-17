/*
 *  OpenMP lecture exercises
 *  Copyright (C) 2011 by Christian Terboven <terboven@rz.rwth-aachen.de>
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 *
 */

#include <omp.h>
#include <stdio.h>

int fib(int n) {
    int x, y;
    if (n < 2) return n;

    x = fib(n - 1);

    y = fib(n - 2);

    return x + y;
}

int main() {
    int n, fibonacci;
    double starttime;
    printf("Please insert n, to calculate fib(n): \n");
    scanf("%d", &n);
    starttime = omp_get_wtime();

    fibonacci = fib(n);

    printf("fib(%d)=%d \n", n, fibonacci);
    printf("calculation took %lf sec\n", omp_get_wtime() - starttime);
    return 0;
}
