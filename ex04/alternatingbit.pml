chan request = [0] of { bit, byte };
chan response = [0] of { bit };


active proctype sender()
{
	byte msg;
	bit currentWindow = 0;
	bit ack;
	snd:
	do
	:: select(msg:0 .. 4); request ! currentWindow, msg;
			do
			:: response ? ack; 
					if
					:: ack == currentWindow; currentWindow++; goto snd;
					:: else;
					fi
			:: timeout; request ! currentWindow, msg;
			od
	od
}


active proctype receiver()
{
	byte msg;
	bit receivedWindow;
	do
	:: request ? receivedWindow, msg; response ! receivedWindow;
	od
}

active proctype blackhole()
{
	byte random;
	randomizer:
	select(random:0 .. 10);
	if
	:: random < 1; request ? _, _;
	:: random < 3; response ? _, _;
	:: else;
	fi
	goto randomizer;
}