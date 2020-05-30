byte b=0; 

proctype p()
{
  b++
}

proctype p2()
{
	byte tmp = b;
	tmp++;
	b = tmp;
}

proctype p3()
{
	atomic
	{
		byte tmp = b;
		tmp++;
		b = tmp;
	}
}



init { 
  /* fill in */
  run p3();
  run p3();
  _nr_pr == 1;
  assert(b == 2);
}








































/*
proctype p() {
  byte tmp = b;
  tmp ++;
  b = tmp
}

*/