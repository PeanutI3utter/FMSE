	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC watchdog */
;
		;
		
	case 4: // STATE 2
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC q */

	case 5: // STATE 2
		;
		now.turn = trpt->bup.ovals[1];
		now.qIsWaiting = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 7: // STATE 5
		;
		now.critical = trpt->bup.oval;
		;
		goto R999;

	case 8: // STATE 6
		;
		now.critical = trpt->bup.oval;
		;
		goto R999;

	case 9: // STATE 7
		;
		now.qIsWaiting = trpt->bup.oval;
		;
		goto R999;

	case 10: // STATE 11
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC p */

	case 11: // STATE 2
		;
		now.turn = trpt->bup.ovals[1];
		now.pIsWaiting = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 13: // STATE 5
		;
		now.critical = trpt->bup.oval;
		;
		goto R999;

	case 14: // STATE 6
		;
		now.critical = trpt->bup.oval;
		;
		goto R999;

	case 15: // STATE 7
		;
		now.pIsWaiting = trpt->bup.oval;
		;
		goto R999;

	case 16: // STATE 11
		;
		p_restor(II);
		;
		;
		goto R999;
	}

