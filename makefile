EXECS=main
MPICC?=gcc

all: ${EXECS}

main: main.c
	gcc -W -Wall -O2 -std=c99 -fopenmp ${EXECS}.c
	export OMP_NUM_THREADS=5
	./a.out

run:
	export OMP_NUM_THREADS=5
	./${EXECS}

clean:
	rm ${EXECS}