mtype = {login, logout} 

inline selectEvent(event) {
  if
   :: event = login
   :: event = logout
   fi   
}

// counts failed authentication tries
byte fail = 0;

// current state
byte currentState = 0;

active proctype Authentication() {

// received event
mtype ev;

do
 :: currentState == 0 ->
           printf("Init");
		   selectEvent(ev);
		   endState0:
          if
            :: fail >= 3 -> currentState = 2
            :: fail < 3  && ev == login  ->  fail = 0; currentState = 1;  
            :: fail < 3  && ev == login  ->  atomic{fail = fail + 1; currentState = (fail == 3 -> 2 : 0)} // as we stay in the same state 
                                                                               // the last assignment is not necessary
                                                                               // only to keep the code a bit more 
                                                                               // understandable
           fi
 :: currentState == 1 -> 
           printf("Authenticated"); 
		   assert(fail == 0); // 2.2 a)
           selectEvent(ev); 
           	endLoggedIn:
            if
            :: ev == logout -> currentState = 0
            fi 
 :: currentState == 2 -> printf("Locked"); assert(fail == 3); /* 2.2 b) */ selectEvent(ev)        
od
}

active proctype watchdog(){
	assert(fail == 3 && currentState == 2 || currentState !=2 && fail < 3);
} 