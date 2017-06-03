EXECS=a.out
MPICC?=gcc

all: main

main: main.c
	gcc -W -Wall -O2 -std=c99 -fopenmp main.c

run:
	export OMP_NUM_THREADS=5
	./${EXECS}

clean:
	rm ${EXECS}