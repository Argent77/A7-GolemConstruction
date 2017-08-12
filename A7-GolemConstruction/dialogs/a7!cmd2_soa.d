// *** Golem command - Special ***

APPEND ~a7!cmd2~
  // Special: SoA Spellhold
  IF WEIGHT #-1 ~Global("spellhold", "LOCALS", 1)~ Golem.Spellhold
    SAY @45011 /* The golem has been rendered inactive by the protective magics of this place. */
    IF ~~ EXIT
  END
END
