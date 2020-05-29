	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC notMaxShort */
;
		;
		
	case 4: // STATE 2
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC q */

	case 5: // STATE 1
		;
		now.i = trpt->bup.oval;
		;
		goto R999;

	case 6: // STATE 2
		;
		now.i = trpt->bup.oval;
		;
		goto R999;

	case 7: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC p */

	case 8: // STATE 1
		;
		now.i = trpt->bup.oval;
		;
		goto R999;

	case 9: // STATE 2
		;
		now.i = trpt->bup.oval;
		;
		goto R999;

	case 10: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;
	}

