mtype = {login, logout}

// selects arbitraily one of the events ’ login ’ or ’logout’ and
// assigns the selected event to parameter ’event’
inline selectEvent(event) {
	if
	:: event = login;
	:: event = logout;
	fi
}

proctype AuthenticationOld() {
	// counts failed authentication tries
	// replace <T1> by a suitable type
	byte fail = 0;
	// current state
	// replace <T2> by a suitable type
	byte currentState = 0;
	// received event
	mtype ev;
	// TODO: IMPLEMENT
	
	state0:
	selectEvent(ev);
	if
	:: fail >= 3; currentState = 2; goto state2;
	:: else; 
		if
		:: ev == login;
			if
			:: fail = fail + 1;
			:: currentState = 1; goto state1;
			fi
		fi
	fi
	state1:
	selectEvent(ev);
	if
	:: ev == logout; currentState = 0; goto state0;
	fi
	state2:
	selectEvent(ev);
}

active proctype Authentication() {
	// counts failed authentication tries
	// replace <T1> by a suitable type
	byte fail = 0;
	// current state
	// replace <T2> by a suitable type
	byte currentState = 0;
	// received event
	mtype ev;
	// TODO: IMPLEMENT
	
	state0:
	if
	:: fail >= 3; currentState = 2; goto state2;
	:: else; 
		if
		:: ev = login;
			if
			:: fail = fail + 1;
			:: currentState = 1; goto state1;
			fi
		:: true; false;
		fi
	fi
	state1:
	if
	:: ev = logout; currentState = 0; goto state0;
	:: true; false;
	fi
	state2:
}

