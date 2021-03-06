chan request = [2] of { byte, chan};

int requestPut[5];

active [2] proctype Server() {
  byte client; 
  chan replyChannel; 
  do
    :: request ? client, replyChannel ->
          printf("Client %d processed by server %d\n", client, _pid); 
          replyChannel ! _pid
  od
}

active [5] proctype Client() {
  /* fill in */
  
  byte serverId;
  chan reply = [0] of { byte };
  loop:
  request ! _pid, reply;
  reply ? serverId;
  requestPut[ _pid % 5]++;
  printf("ACK Client %d acknowledged by Server %d\n", _pid, serverId);
  goto loop;
}
