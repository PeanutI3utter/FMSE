int isPrinting;

chan printingChan = [0] of { int };

active [2] proctype computer()
{
	printingChan ! _pid;
}

active proctype printer()
{
	int rcv;
	
	endStatePrinter:
	do
	:: printingChan ? rcv; isPrinting++; 
			assert(isPrinting < 2); 
			printf("%d\n", rcv);
			isPrinting--;
	od
}

	