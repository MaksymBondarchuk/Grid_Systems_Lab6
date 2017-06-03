#include <stdio.h>
#include <omp.h>

const long RUNS_NUMBER = 10000000;

int main() {

#pragma omp parallel
    {
        int task_id = omp_get_thread_num();
        printf("Start - %d\n", task_id);
    }

    double global_value = .0;

#pragma omp parallel num_threads(4) default(none) reduction(+:global_value)
    for (long i = 0; i < RUNS_NUMBER; ++i) {
        global_value += (i - 1) * (i + 1);
    }

//#pragma omp master
    printf("Calculated value = %f\n", global_value);

    return 0;
}