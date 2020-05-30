bool printing
byte crit

active [2] proctype pc() {
  do
    ::atomic {
      !printing
      printing = true
    }
    crit++
    printf("Sending file to the printer %d", _pid)
    crit--
    printing = false
  od
}

active proctype check() {
  assert(crit <= 1)
}
