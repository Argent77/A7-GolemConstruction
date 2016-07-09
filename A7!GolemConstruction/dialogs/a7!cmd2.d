// *** Golem commands (Lesser flesh/clay/stone golem variants and maggot golems) ***

BEGIN ~a7!cmd2~

IF ~OR(2) !Allegiance(LastTalkedToBy, PC) NextTriggerObject(LastTalkedToBy) !HaveSpellRES("a7!smgl")~ Golem.1
  SAY @45000 /* The golem ignores you completely. */
  IF ~~ EXIT
END

IF ~Allegiance(LastTalkedToBy, PC) NextTriggerObject(LastTalkedToBy) HaveSpellRES("a7!smgl")~ Golem.2
  SAY @45001 /* The golem awaits your command. */
  + ~!Global("Command", "LOCALS", 0) Allegiance(Myself, FAMILIAR)~ + @45002 /* Follow me! */
      DO ~SetGlobal("Command", "LOCALS", 0)~ EXIT
  + ~!Global("Command", "LOCALS", 0) !Allegiance(Myself, FAMILIAR)~ + @45002 /* Follow me! */
      DO ~SetGlobal("Command", "LOCALS", 0) ChangeEnemyAlly(Myself, FAMILIAR) AddFamiliar()~ EXIT
  + ~!Global("Command", "LOCALS", 2) Allegiance(Myself, NEUTRAL)~ + @45004 /* Stand guard! */
      DO ~SetGlobal("Command", "LOCALS", 2) SaveObjectLocation("LOCALS", "Location", Myself) Face(S)~ EXIT
  + ~!Global("Command", "LOCALS", 2) !Allegiance(Myself, NEUTRAL)~ + @45004 /* Stand guard! */
      DO ~SetGlobal("Command", "LOCALS", 2) RemoveFamiliar() ChangeEnemyAlly(Myself, GOODBUTBLUE) SaveObjectLocation("LOCALS", "Location", Myself) Face(S)~ EXIT
  ++ @45006 /* Destroy yourself! */ + Golem.3
  ++ @45007 /* Nevermind. */ EXIT
END

IF ~~ Golem.3
  SAY @45008 /* This action can not be undone. Are you certain? */
  ++ @45009 /* Yes! */ DO ~SetGlobal("dismiss", "LOCALS", 1)~ EXIT
  ++ @45010 /* No! */ EXIT
END