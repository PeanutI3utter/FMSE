/*
     template to start with
 */
#define N 5

active proctype ARRAY() {
	int i;
	int prod;
	int a[N]; 
	
	/* fill in */
	/*a) */
	int iteration;
	for(iteration: 0 .. N - 1) {
		select(i: 1 .. 5);
		a[iteration] = i;
	}
	
	prod = 1;
	for(i: 0 .. N - 1) {
		prod = prod * a[i];
	}
	
	/* Print something nice */
	printf("The product is: %d\n", prod)
}
