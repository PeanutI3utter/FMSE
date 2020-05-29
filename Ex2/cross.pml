int cross[5]; // {north, east, south, west, center}
int carsoncross = 0;

proctype car(){
	int start = _pid % 4;
	cross[start] = _pid;
	do
	:: atomic{cross[4] == _pid; cross[4] = 0; carsoncross = carsoncross - 1;  break};
	:: else; atomic{/*cross[4] == 0 &&*/ cross[(4 + start - 1) % 4] == 0; cross[4] = _pid; carsoncross = carsoncross + 1; cross[start] = 0}
	od  
}

proctype watchdog(){
	assert(carsoncross <= 1 && carsoncross >= 0);
}

init{
	int i;
	atomic{
		for(i: 0 .. 3){
			run car();
		}
		run watchdog();
	} 
}