byte turn = 0;
bool ploop = true;
bool qloop = true;
byte critical = 0;

active proctype p() {
	bp:
     turn = 1; 
     turn == 2; 
     // enter critical section
     critical++;
     critical--;
     // leave critical section
     if
     :: ploop; goto bp;
     :: else;
     fi
}

active proctype q() {
	bq:
    turn = 2;
    turn == 1;
     // enter critical section
     critical++;
     critical--;
     // leave critical section
    if
    :: qloop; goto bq;
    :: else;
    fi
}

active proctype invariant()
{
	assert(critical <= 1);
}
	
