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

		 /* PROC notMaxShort */
	case 3: // STATE 1 - explode.pml:18 - [assert((i!=32767))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		spin_assert((now.i!=32767), "(i!=32767)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - explode.pml:19 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC q */
	case 5: // STATE 1 - explode.pml:12 - [i = (i-1)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][1] = 1;
		(trpt+1)->bup.oval = now.i;
		now.i = (now.i-1);
#ifdef VAR_RANGES
		logval("i", now.i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 2 - explode.pml:13 - [i = (i-2)] (0:0:1 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		(trpt+1)->bup.oval = now.i;
		now.i = (now.i-2);
#ifdef VAR_RANGES
		logval("i", now.i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 6 - explode.pml:15 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][6] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC p */
	case 8: // STATE 1 - explode.pml:5 - [i = (i+2)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		(trpt+1)->bup.oval = now.i;
		now.i = (now.i+2);
#ifdef VAR_RANGES
		logval("i", now.i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 2 - explode.pml:6 - [i = (i+4)] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = now.i;
		now.i = (now.i+4);
#ifdef VAR_RANGES
		logval("i", now.i);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 6 - explode.pml:8 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][6] = 1;
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

