int isPrinting;

active [2] proctype print()
{
	atomic
	{
		isPrinting < 1;
		isPrinting++;
	}
	isPrinting--;
}

active proctype watchdog()
{
	assert(isPrinting <= 1);
}
	