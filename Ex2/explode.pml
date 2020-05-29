short i = 0;

active proctype p() {
  do 
   :: i = i + 2 // p.1
   :: i = i + 4 // p.2
  od
}

active proctype q() {
  do
   :: i = i - 1; // q.1
   :: i = i - 2; // q.2
  od
}

active proctype notMaxShort() {
  assert i != 32767 // notMaxShort
}

