#include <omp.h>
#include <stdio.h>

#include <cstdlib>
#include <ctime>
#include <iostream>
using namespace std;

void init(int *array, int length) {
    srand((unsigned)time(0));
    for (int i = 0; i < length; i++) array[i] = rand() % 1234 + 1;
}

void swap(int &a, int &b) {
    int temp = a;
    a = b;
    b = temp;
}

int pivot(int *array, int first, int last) {
    int p = first;
    int pivotElement = array[first];
    for (int i = first + 1; i <= last; i++) {
        if (array[i] <= pivotElement) {
            p++;
            swap(array[i], array[p]);
        }
    }
    swap(array[p], array[first]);
    return p;
}

void serial_quicksort(int *array, int first, int last) {
    int pivotElement;
    if (first < last) {
        pivotElement = pivot(array, first, last);
        serial_quicksort(array, first, pivotElement - 1);
        serial_quicksort(array, pivotElement + 1, last);
    }
}

void quicksort(int *array, int first, int last) {
    int pivotElement;
    if ((last - first + 1) < 10000) {
        serial_quicksort(array, first, last);
    } else {
        pivotElement = pivot(array, first, last);
#pragma omp task default(shared)
        { quicksort(array, first, pivotElement - 1); }
#pragma omp task default(shared)
        { quicksort(array, pivotElement + 1, last); }
#pragma omp taskwait
    }
}

bool checkFn(int *array, int length) {
    for (int i = 0; i < length - 1; i++) {
        if (array[i] > array[i + 1]) {
            cout << "array[" << i << "] > array[" << i + 1 << "]" << endl;
            return false;
        }
    }
    return true;
}

int main(int argc, char *argv[]) {
    int length;
    int *toBeSorted;
    double t1, t2;
    if (argc < 2) {
        length = 6000000;
    } else {
        length = atoi(argv[1]);
    }
    toBeSorted = new int[length];

    init(toBeSorted, length);
    cout << "Sorting an array of " << length << " elements." << endl;

    t1 = omp_get_wtime();
#pragma omp parallel
#pragma omp single
    { quicksort(toBeSorted, 0, length - 1); }
    t2 = omp_get_wtime() - t1;

    cout << "quicksort took " << t2 << " sec. to complete" << endl;
    if (!checkFn(toBeSorted, length)) {
        cout << "validation failed!" << endl;
    }
    delete[] toBeSorted;
}
