/*
  Process "producer" sends numbers from "0" to "9". The sent number is read by process
  "b". As we use a rendez-vous channel, process "consumer" needs first to read
  from the channel before the "producer" can continue.
 */
chan myChan = [0] of  { byte }

active proctype producer(){
	byte i;
	for(i: 0 .. 9)
	{
		myChan ! i;
	} 
}

active proctype consumer() {
	byte i;
	byte a;
	for(i: 0 .. 9)
	{
		myChan ? a;
		printf("%d\n", a);
	}
}
