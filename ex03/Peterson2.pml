bool pIsWaiting = false;
bool qIsWaiting = false;
byte turn = 0;
byte critical = 0;

active proctype p() {
 do ::
    atomic { 
      pIsWaiting = true;
      turn = 2; // allow other process to proceed first
    }
    !qIsWaiting || turn == 1;
    // enter critical section
     critical++;
     critical--;
    // leave critical section
    pIsWaiting = false
 od
}

active proctype q() {
 do ::
    atomic {
      qIsWaiting = true;
      turn = 1; // allow other process to proceed first
    }
    !pIsWaiting || turn == 2;
    // enter critical section
     critical++;
     critical--;
    // leave critical section    
    qIsWaiting = false
 od
}

active proctype watchdog()
{
	assert(critical < 2);
}
