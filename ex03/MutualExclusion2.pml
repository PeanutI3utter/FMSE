bool q1 = false;
bool q2 = false;
bool ploop = false;
bool qloop = false;
byte critical = 0;

active proctype p() {
  bp:
  q1 = true;
  q2 == false;  
  // enter critical section
     critical++;
     critical--;
  // leave critical section  
  q1 = false;
  if
  :: ploop; goto bp;
  :: else;
  fi
}

active proctype q() {
  bq:
  q2 = true;
  q1 == false;
  // enter critical section
     critical++;
     critical--;
  // leave critical section
  q2 = false;
  if
  :: ploop; goto bq;
  :: else;
  fi
}
