// *** Dialog for neutral golems ***

BEGIN ~a7!cmdx~

IF ~True()~ cmd.1
  SAY @45000 /* The golem ignores you completely. */
  IF ~~ EXIT
END
