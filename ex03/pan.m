#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC watchdog */
	case 3: // STATE 1 - Peterson2.pml:38 - [assert((critical<2))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		spin_assert((((int)now.critical)<2), "(critical<2)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - Peterson2.pml:39 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC q */
	case 5: // STATE 1 - Peterson2.pml:24 - [qIsWaiting = 1] (0:4:2 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.qIsWaiting);
		now.qIsWaiting = 1;
#ifdef VAR_RANGES
		logval("qIsWaiting", ((int)now.qIsWaiting));
#endif
		;
		/* merge: turn = 1(4, 2, 4) */
		reached[1][2] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.turn);
		now.turn = 1;
#ifdef VAR_RANGES
		logval("turn", ((int)now.turn));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 6: // STATE 4 - Peterson2.pml:27 - [((!(pIsWaiting)||(turn==2)))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		if (!(( !(((int)now.pIsWaiting))||(((int)now.turn)==2))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 5 - Peterson2.pml:29 - [critical = (critical+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		(trpt+1)->bup.oval = ((int)now.critical);
		now.critical = (((int)now.critical)+1);
#ifdef VAR_RANGES
		logval("critical", ((int)now.critical));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 6 - Peterson2.pml:30 - [critical = (critical-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		(trpt+1)->bup.oval = ((int)now.critical);
		now.critical = (((int)now.critical)-1);
#ifdef VAR_RANGES
		logval("critical", ((int)now.critical));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 7 - Peterson2.pml:32 - [qIsWaiting = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		(trpt+1)->bup.oval = ((int)now.qIsWaiting);
		now.qIsWaiting = 0;
#ifdef VAR_RANGES
		logval("qIsWaiting", ((int)now.qIsWaiting));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 11 - Peterson2.pml:34 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][11] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC p */
	case 11: // STATE 1 - Peterson2.pml:9 - [pIsWaiting = 1] (0:4:2 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.pIsWaiting);
		now.pIsWaiting = 1;
#ifdef VAR_RANGES
		logval("pIsWaiting", ((int)now.pIsWaiting));
#endif
		;
		/* merge: turn = 2(4, 2, 4) */
		reached[0][2] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.turn);
		now.turn = 2;
#ifdef VAR_RANGES
		logval("turn", ((int)now.turn));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 12: // STATE 4 - Peterson2.pml:12 - [((!(qIsWaiting)||(turn==1)))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][4] = 1;
		if (!(( !(((int)now.qIsWaiting))||(((int)now.turn)==1))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 5 - Peterson2.pml:14 - [critical = (critical+1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][5] = 1;
		(trpt+1)->bup.oval = ((int)now.critical);
		now.critical = (((int)now.critical)+1);
#ifdef VAR_RANGES
		logval("critical", ((int)now.critical));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 6 - Peterson2.pml:15 - [critical = (critical-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		(trpt+1)->bup.oval = ((int)now.critical);
		now.critical = (((int)now.critical)-1);
#ifdef VAR_RANGES
		logval("critical", ((int)now.critical));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 7 - Peterson2.pml:17 - [pIsWaiting = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.oval = ((int)now.pIsWaiting);
		now.pIsWaiting = 0;
#ifdef VAR_RANGES
		logval("pIsWaiting", ((int)now.pIsWaiting));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 11 - Peterson2.pml:19 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][11] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

