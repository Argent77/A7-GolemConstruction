// *** Golem commands ***

BEGIN ~a7!cmd~

IF ~!Allegiance(LastTalkedToBy, PC)~ Golem.1
  SAY @45000 /* The golem ignores you completely. */
  IF ~~ EXIT
END

IF ~Allegiance(LastTalkedToBy, PC)~ Golem.2
  SAY @45001 /* The golem awaits your command. */
  + ~!Global("Command", "LOCALS", 0) Allegiance(Myself, FAMILIAR)~ + @45002 /* Follow me! */
      DO ~SetGlobal("Command", "LOCALS", 0)~ EXIT
  + ~!Global("Command", "LOCALS", 0) !Allegiance(Myself, FAMILIAR)~ + @45002 /* Follow me! */
      DO ~SetGlobal("Command", "LOCALS", 0) ChangeEnemyAlly(Myself, FAMILIAR) AddFamiliar()~ EXIT
  + ~!Global("Command", "LOCALS", 1) !Name("a7!glmg", Myself) Allegiance(Myself, FAMILIAR)~ + @45003 /* Follow and protect me! */
      DO ~SetGlobal("Command", "LOCALS", 1)~ EXIT
  + ~!Global("Command", "LOCALS", 1) !Name("a7!glmg", Myself) !Allegiance(Myself, FAMILIAR)~ + @45003 /* Follow and protect me! */
      DO ~SetGlobal("Command", "LOCALS", 1) ChangeEnemyAlly(Myself, FAMILIAR) AddFamiliar()~ EXIT
  + ~!Global("Command", "LOCALS", 2) Allegiance(Myself, NEUTRAL)~ + @45004 /* Stand guard! */
      DO ~SetGlobal("Command", "LOCALS", 2) SaveObjectLocation("LOCALS", "Location", Myself) Face(S)~ EXIT
  + ~!Global("Command", "LOCALS", 2) !Allegiance(Myself, NEUTRAL)~ + @45004 /* Stand guard! */
      DO ~SetGlobal("Command", "LOCALS", 2) RemoveFamiliar() ChangeEnemyAlly(Myself, GOODBUTBLUE) SaveObjectLocation("LOCALS", "Location", Myself) Face(S)~ EXIT
  + ~!Global("Command", "LOCALS", 2) !Name("a7!glmg", Myself) Allegiance(Myself, NEUTRAL)~ + @45005 /* Stand guard and defend the area! */
      DO ~SetGlobal("Command", "LOCALS", 3) SaveObjectLocation("LOCALS", "Location", Myself) Face(S)~ EXIT
  + ~!Global("Command", "LOCALS", 2) !Name("a7!glmg", Myself) !Allegiance(Myself, NEUTRAL)~ + @45005 /* Stand guard and defend the area! */
      DO ~SetGlobal("Command", "LOCALS", 3) RemoveFamiliar() ChangeEnemyAlly(Myself, GOODBUTBLUE) SaveObjectLocation("LOCALS", "Location", Myself) Face(S)~ EXIT
  ++ @45006 /* Destroy yourself! */ + Golem.3
  ++ @45007 /* Nevermind. */ EXIT
END

IF ~~ Golem.3
  SAY @45008 /* This action can not be undone. Are you certain? */
  ++ @45009 /* Yes! */ DO ~SetGlobal("dismiss", "LOCALS", 1)~ EXIT
  ++ @45010 /* No! */ EXIT
END
