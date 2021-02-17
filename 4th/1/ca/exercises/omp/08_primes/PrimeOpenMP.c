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

//////////////////////////////////////////////////////////////////////////////
//    Copyright (C) 2005 Intel Corp.
//
//    Subject to the terms and conditions set forth below, Intel hereby
//    grants you a nonexclusive, nontransferable license, to use,
//    reproduce and distribute the example code sequences contained
//    herein, in object code format, solely as part of your computer
//    program(s) and solely in order to allow your computer program(s) to
//    implement the multimedia instruction extensions contained in such
//    sequences solely with respect to the Intel instruction set
//    architecture.  No other license, express, implied, statutory, by
//    estoppel or otherwise, to any other intellectual property rights is
//    granted herein.
//
//    ALL INFORMATION, SAMPLES AND OTHER MATERIALS PROVIDED HEREIN
//    INCLUDING, WITHOUT LIMITATION, THE EXAMPLE CODE SEQUENCES ARE
//    PROVIDED "AS IS" WITH NO WARRANTIES, EXPRESS, IMPLIED, STATUTORY OR
//    OTHERWISE, AND INTEL SPECIFICALLY DISCLAIMS ANY IMPLIED WARRANTY OF
//    MERCHANTABILITY,  NONINFRINGEMENT OR FITNESS FOR ANY PARTICULAR
//    PURPOSE.
//
//    THE MATERIALS PROVIDED HEREIN ARE PROVIDED WITHOUT CHARGE.
//    THEREFORE, IN NO EVENT WILL INTEL BE LIABLE FOR ANY DAMAGES OF ANY
//    KIND, INCLUDING DIRECT OR INDIRECT DAMAGES, LOSS OF DATA, LOST
//    PROFITS, COST OF COVER OR SPECIAL, INCIDENTAL, CONSEQUENTIAL,
//    DAMAGES ARISING FROM THE USE OF THE MATERIALS PROVIDED HEREIN,
//    INCLUDING WITHOUT LIMITATION THE EXAMPLE CODE SEQUENCES, HOWEVER
//    CAUSED AND ON ANY THEORY OF LIABILITY.  THIS LIMITATION WILL APPLY
//    EVEN IF INTEL OR ANY AUTHORIZED AGENT OF INTEL HAS BEEN ADVISED OF
//    THE POSSIBILITY OF SUCH DAMAGE.
//
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
//
//  This implments a brute force method of determining the prime numbers
//  in a given range 1..n.
//
///////////////////////////////////////////////////////////////////////////////
#include <math.h>
#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
static int gProgress = 0, gPrimesFound = 0;
long globalPrimes[1000000];
int CLstart, CLend;

///////////////////////////////////////////////////////////////////////////////
//
//  GetCommandLineArguments
//
//  Grabs the number of threads from the commandline
//
///////////////////////////////////////////////////////////////////////////////
void GetCommandLineArguments(int argc, char **argv, int *start, int *end) {
    if (argc == 3) {
        CLstart = atoi(argv[1]);
        CLend = atoi(argv[2]);
    } else {
        printf("Usage:- %s <start range> <end range>\n", argv[0]);
        exit(-1);
    }
    if (CLstart > CLend) {
        printf("Start value must be less than or equal to end\n");
        exit(-1);
    }
    if (CLstart < 1 && CLend < 2) {
        printf("Range must be positive integers\n");
        exit(-1);
    }
    *start = CLstart;
    *end = CLend;
    if (CLstart < 2) *start = 2;
    if (*start <= 2) globalPrimes[gPrimesFound++] = 2;
}

void ShowProgress(int val, int range) {
    int percentDone = 0;

    gProgress++;

    percentDone = (int)((float)gProgress / (float)range * 200.0f + 0.5f);

    if (percentDone % 10 == 0) printf("\b\b\b\b%3d%%", percentDone);
}

int TestForPrime(int val) {
    int limit, factor = 3;

    limit = (long)(sqrtf((float)val) + 0.5f);
    while ((factor <= limit) && (val % factor)) factor++;

    return (factor > limit);
}

void FindPrimes(int start, int end) {
    // start is always odd
    int range = end - start + 1;
    int i;

#pragma omp parallel for
    for (i = start; i <= end; i += 2) {
        if (TestForPrime(i)) {
            globalPrimes[gPrimesFound++] = i;
        }

        ShowProgress(i, range);
    }
}

int main(int argc, char **argv) {
    int start, end;
    double before, after;

    GetCommandLineArguments(argc, argv, &start, &end);

    if ((start % 2) == 0)
        start = start + 1;  // ensure we start with an odd number

    before = omp_get_wtime();
    FindPrimes(start, end);
    after = omp_get_wtime();

    printf("\n\n%8d primes found between %6d and %6d in %f secs\n",
           gPrimesFound, CLstart, CLend, (after - before));
}
