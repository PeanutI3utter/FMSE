#define N 5

active proctype ARRAY() {
     int a[N]; 
     
     int i;
     int prod;

     /* use non-determinism to fill the 
        array with values */
     for (i in a) {
       if
	 :: a[i] = 1
	 :: a[i] = 2
	 :: a[i] = 3
	 :: a[i] = 4
	 :: a[i] = 5
       fi;
     };
     /* sum the array up using a for loop */
     prod = 1;
     for (i in a) {
       prod = prod * a[i]
     };
     
     /* a) */
     assert(prod >= 0);
     
     /* b) */
     for(i in a){
     	assert(prod >= a[i]);
     }
     
     /* c) */
     select(i: 1 .. n);
     assert(prod >= a[i]);
     
     /* Print something nice */
     printf("The product is: %d\n", prod);     
}
