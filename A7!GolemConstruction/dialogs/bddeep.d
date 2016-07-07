// *** SoD: Brother Deepvein ***

ADD_STATE_TRIGGER ~bddeep~ 0 ~Global("A7!Reward", "LOCALS", 0)~

APPEND ~bddeep~

  IF WEIGHT #-1 ~Global("A7!Reward", "LOCALS", 0) AreaCheck("bd3000")~ bddeep.1
    SAY @40000 /* Greetings again. A bit o' mithral for ye'. */
    = @40001 /* We found it in Coldhearth's secret stash. It's priceless in the right hands. No need t' thank me, <CHARNAME>. Ye earned it, sure enough. */
    IF ~~ DO ~SetGlobal("A7!Reward", "LOCALS", 1) GiveItemCreate("a7!mith", LastTalkedToBy, 1, 0, 0)~  EXIT
  END

END
