// *** Golem commands ***

BEGIN ~a7!cmd~

IF ~OR(2) !Allegiance(LastTalkedToBy, PC) !Global("MasterOverride", "LOCALS", 1) NextTriggerObject(LastTalkedToBy) !HaveSpellRES("a7!smgl")~ Golem.1
  SAY @45000 /* The golem ignores you completely. */
  IF ~~ EXIT
END

IF ~Allegiance(LastTalkedToBy, PC) OR(2) Global("MasterOverride", "LOCALS", 1) NextTriggerObject(LastTalkedToBy) HaveSpellRES("a7!smgl")~ Golem.2
  SAY @45001 /* The golem awaits your command. */
  + ~OR(4) CheckSpellState(Myself,A7!GOLEM_LESSER) CheckSpellState(Myself,A7!GOLEM_NORMAL) CheckSpellState(Myself,A7!GOLEM_GREATER) CheckSpellState(Myself,A7!GOLEM_PERFECT)~
    + @45013 /* Show number of killed opponents. */ DO ~SetTokenGlobal("A7!KillCount", "LOCALS", "A7_GOLEMKILLS")~ FLAGS 512 + Golem.KillCount

  // Flesh golem
  + ~Global("A7!Promote","LOCALS",1) !ActuallyInCombat()
     CheckSpellState(Myself,A7!GOLEM_FLESH) CheckSpellState(Myself,A7!GOLEM_LESSER) NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemFlesh","LOCALS",1)
     PartyHasItem("a7!body")~ + @45014 /* Upgrade golem. */
      DO ~SetGlobal("A7!UpgradeCost", "GLOBAL", 1)~ + Golem.Upgrade
  + ~Global("A7!Promote","LOCALS",1) !ActuallyInCombat()
     CheckSpellState(Myself,A7!GOLEM_FLESH) CheckSpellState(Myself,A7!GOLEM_NORMAL) NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemFlesh","LOCALS",1)
     NumItemsPartyGT("a7!body",1) PartyHasItem("scrl97")~ + @45014 /* Upgrade golem. */
      DO ~SetGlobal("A7!UpgradeCost", "GLOBAL", 2)~ + Golem.Upgrade
  + ~Global("A7!Promote","LOCALS",1) !ActuallyInCombat()
     CheckSpellState(Myself,A7!GOLEM_FLESH) CheckSpellState(Myself,A7!GOLEM_GREATER) NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemFlesh","LOCALS",1)
     PartyHasItem("a7!glfl")~ + @45014 /* Upgrade golem. */
      DO ~SetGlobal("A7!UpgradeCost", "GLOBAL", 3)~ + Golem.Upgrade

  // Clay golem
  + ~Global("A7!Promote","LOCALS",1) !ActuallyInCombat()
     CheckSpellState(Myself,A7!GOLEM_CLAY) CheckSpellState(Myself,A7!GOLEM_LESSER) NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemClay","LOCALS",1)
     PartyHasItem("a7!clay") PartyHasItem("scrl1h")~ + @45014 /* Upgrade golem. */
      DO ~SetGlobal("A7!UpgradeCost", "GLOBAL", 11)~ + Golem.Upgrade
  + ~Global("A7!Promote","LOCALS",1) !ActuallyInCombat()
     CheckSpellState(Myself,A7!GOLEM_CLAY) CheckSpellState(Myself,A7!GOLEM_NORMAL) NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemClay","LOCALS",1)
     NumItemsPartyGT("a7!clay",1)~ + @45014 /* Upgrade golem. */
      DO ~SetGlobal("A7!UpgradeCost", "GLOBAL", 12)~ + Golem.Upgrade
  + ~Global("A7!Promote","LOCALS",1) !ActuallyInCombat()
     CheckSpellState(Myself,A7!GOLEM_CLAY) CheckSpellState(Myself,A7!GOLEM_GREATER) NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemClay","LOCALS",1)
     PartyHasItem("a7!glcl")~ + @45014 /* Upgrade golem. */
      DO ~SetGlobal("A7!UpgradeCost", "GLOBAL", 13)~ + Golem.Upgrade

  // Stone golem
  + ~Global("A7!Promote","LOCALS",1) !ActuallyInCombat()
     CheckSpellState(Myself,A7!GOLEM_STONE) CheckSpellState(Myself,A7!GOLEM_LESSER) NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemStone","LOCALS",1)
     PartyHasItem("a7!ston") PartyHasItem("scrl1o")~ + @45014 /* Upgrade golem. */
      DO ~SetGlobal("A7!UpgradeCost", "GLOBAL", 21)~ + Golem.Upgrade
  + ~Global("A7!Promote","LOCALS",1) !ActuallyInCombat()
     CheckSpellState(Myself,A7!GOLEM_STONE) CheckSpellState(Myself,A7!GOLEM_NORMAL) NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemStone","LOCALS",1)
     NumItemsPartyGT("a7!ston",1)~ + @45014 /* Upgrade golem. */
      DO ~SetGlobal("A7!UpgradeCost", "GLOBAL", 22)~ + Golem.Upgrade
  + ~Global("A7!Promote","LOCALS",1) !ActuallyInCombat()
     CheckSpellState(Myself,A7!GOLEM_STONE) CheckSpellState(Myself,A7!GOLEM_GREATER) NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemStone","LOCALS",1)
     PartyHasItem("a7!glst")~ + @45014 /* Upgrade golem. */
      DO ~SetGlobal("A7!UpgradeCost", "GLOBAL", 23)~ + Golem.Upgrade

  // Iron golem
  + ~Global("A7!Promote","LOCALS",1) !ActuallyInCombat()
     CheckSpellState(Myself,A7!GOLEM_IRON) CheckSpellState(Myself,A7!GOLEM_LESSER) NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemIron","LOCALS",1)
     PartyHasItem("a7!iron") PartyHasItem("scrl2e")~ + @45014 /* Upgrade golem. */
      DO ~SetGlobal("A7!UpgradeCost", "GLOBAL", 31)~ + Golem.Upgrade
  + ~Global("A7!Promote","LOCALS",1) !ActuallyInCombat()
     CheckSpellState(Myself,A7!GOLEM_IRON) CheckSpellState(Myself,A7!GOLEM_NORMAL) NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemIron","LOCALS",1)
     NumItemsPartyGT("a7!iron",1)~ + @45014 /* Upgrade golem. */
      DO ~SetGlobal("A7!UpgradeCost", "GLOBAL", 32)~ + Golem.Upgrade
  + ~Global("A7!Promote","LOCALS",1) !ActuallyInCombat()
     CheckSpellState(Myself,A7!GOLEM_IRON) CheckSpellState(Myself,A7!GOLEM_GREATER) NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemIron","LOCALS",1)
     PartyHasItem("a7!glir")~ + @45014 /* Upgrade golem. */
      DO ~SetGlobal("A7!UpgradeCost", "GLOBAL", 33)~ + Golem.Upgrade

  // Mithral golem
  + ~Global("A7!Promote","LOCALS",1) !ActuallyInCombat()
     CheckSpellState(Myself,A7!GOLEM_MITHRAL) CheckSpellState(Myself,A7!GOLEM_LESSER) NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemMithral","LOCALS",1)
     PartyHasItem("a7!mith")~ + @45014 /* Upgrade golem. */
      DO ~SetGlobal("A7!UpgradeCost", "GLOBAL", 41)~ + Golem.Upgrade
  + ~Global("A7!Promote","LOCALS",1) !ActuallyInCombat()
     CheckSpellState(Myself,A7!GOLEM_MITHRAL) CheckSpellState(Myself,A7!GOLEM_NORMAL) NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemMithral","LOCALS",1)
     NumItemsPartyGT("a7!mith",1)~ + @45014 /* Upgrade golem. */
      DO ~SetGlobal("A7!UpgradeCost", "GLOBAL", 42)~ + Golem.Upgrade
  + ~Global("A7!Promote","LOCALS",1) !ActuallyInCombat()
     CheckSpellState(Myself,A7!GOLEM_MITHRAL) CheckSpellState(Myself,A7!GOLEM_GREATER) NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemMithral","LOCALS",1)
     PartyHasItem("a7!glmi")~ + @45014 /* Upgrade golem. */
      DO ~SetGlobal("A7!UpgradeCost", "GLOBAL", 43)~ + Golem.Upgrade

  // Adamantite golem
  + ~Global("A7!Promote","LOCALS",1) !ActuallyInCombat()
     CheckSpellState(Myself,A7!GOLEM_ADAMANTITE) CheckSpellState(Myself,A7!GOLEM_LESSER) NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemAdamantite","LOCALS",1)
     NumItemsPartyGT("a7!adam",1)~ + @45014 /* Upgrade golem. */
      DO ~SetGlobal("A7!UpgradeCost", "GLOBAL", 51)~ + Golem.Upgrade
  + ~Global("A7!Promote","LOCALS",1) !ActuallyInCombat()
     CheckSpellState(Myself,A7!GOLEM_ADAMANTITE) CheckSpellState(Myself,A7!GOLEM_NORMAL) NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemAdamantite","LOCALS",1)
     NumItemsPartyGT("a7!adam",3)~ + @45014 /* Upgrade golem. */
      DO ~SetGlobal("A7!UpgradeCost", "GLOBAL", 52)~ + Golem.Upgrade
  + ~Global("A7!Promote","LOCALS",1) !ActuallyInCombat()
     CheckSpellState(Myself,A7!GOLEM_ADAMANTITE) CheckSpellState(Myself,A7!GOLEM_GREATER) NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemAdamantite","LOCALS",1)
     PartyHasItem("a7!glad1")~ + @45014 /* Upgrade golem. */
      DO ~SetGlobal("A7!UpgradeCost", "GLOBAL", 53)~ + Golem.Upgrade
  + ~Global("A7!Promote","LOCALS",1) !ActuallyInCombat()
     CheckSpellState(Myself,A7!GOLEM_ADAMANTITE) CheckSpellState(Myself,A7!GOLEM_GREATER) NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemAdamantite","LOCALS",1)
     PartyHasItem("a7!glad2")~ + @45014 /* Upgrade golem. */
      DO ~SetGlobal("A7!UpgradeCost", "GLOBAL", 54)~ + Golem.Upgrade

  + ~!Global("Command", "LOCALS", 0) Allegiance(Myself, FAMILIAR)~ + @45002 /* Follow me! */
      DO ~SetGlobal("Command", "LOCALS", 0)~ EXIT
  + ~!GlobalGT("A7!GolemCount", "GLOBAL", %max_golem_count%)
     !Global("Command", "LOCALS", 0) !Allegiance(Myself, FAMILIAR)~ + @45002 /* Follow me! */
      DO ~IncrementGlobal("A7!GolemCount", "GLOBAL", 1) SetGlobal("CountActive", "LOCALS", 1) SetGlobal("Command", "LOCALS", 0) ChangeEnemyAlly(Myself, FAMILIAR) AddFamiliar() ApplySpellRES("a7!vis1", Myself)~ EXIT
  + ~GlobalGT("A7!GolemCount", "GLOBAL", %max_golem_count%)
     !Global("Command", "LOCALS", 0) !Allegiance(Myself, FAMILIAR)~ + @45002 /* Follow me! */ + Golem.Limit.Reached

  + ~!Global("Command", "LOCALS", 1) Allegiance(Myself, FAMILIAR)~ + @45003 /* Follow and protect me! */
      DO ~SetGlobal("Command", "LOCALS", 1)~ EXIT
  + ~!GlobalGT("A7!GolemCount", "GLOBAL", %max_golem_count%)
     !Global("Command", "LOCALS", 1) !Allegiance(Myself, FAMILIAR)~ + @45003 /* Follow and protect me! */
      DO ~IncrementGlobal("A7!GolemCount", "GLOBAL", 1) SetGlobal("CountActive", "LOCALS", 1) SetGlobal("Command", "LOCALS", 1) ChangeEnemyAlly(Myself, FAMILIAR) AddFamiliar() ApplySpellRES("a7!vis1", Myself)~ EXIT
  + ~GlobalGT("A7!GolemCount", "GLOBAL", %max_golem_count%)
     !Global("Command", "LOCALS", 1) !Allegiance(Myself, FAMILIAR)~ + @45003 /* Follow and protect me! */ + Golem.Limit.Reached

  + ~!Global("Command", "LOCALS", 2) !Allegiance(Myself, FAMILIAR)~ + @45004 /* Stand guard! */
      DO ~SetGlobal("Command", "LOCALS", 2) SaveObjectLocation("LOCALS", "Location", Myself) Face(S)~ EXIT
  + ~!Global("Command", "LOCALS", 2) Allegiance(Myself, FAMILIAR)~ + @45004 /* Stand guard! */
      DO ~IncrementGlobal("A7!GolemCount", "GLOBAL", -1) SetGlobal("Command", "LOCALS", 2) RemoveFamiliar() ChangeEnemyAlly(Myself, GOODBUTBLUE) ApplySpellRES("a7!vis2", Myself) SaveObjectLocation("LOCALS", "Location", Myself) Face(S)~ EXIT

  + ~!Global("Command", "LOCALS", 3) !Allegiance(Myself, FAMILIAR)~ + @45005 /* Stand guard and defend the area! */
      DO ~SetGlobal("Command", "LOCALS", 3) SaveObjectLocation("LOCALS", "Location", Myself) Face(S)~ EXIT
  + ~!Global("Command", "LOCALS", 3) Allegiance(Myself, FAMILIAR)~ + @45005 /* Stand guard and defend the area! */
      DO ~IncrementGlobal("A7!GolemCount", "GLOBAL", -1) SetGlobal("Command", "LOCALS", 3) RemoveFamiliar() ChangeEnemyAlly(Myself, GOODBUTBLUE) ApplySpellRES("a7!vis2", Myself) SaveObjectLocation("LOCALS", "Location", Myself) Face(S)~ EXIT

  ++ @45006 /* Destroy yourself! */ + Golem.3
  ++ @45007 /* Nevermind. */ EXIT
END

IF ~~ Golem.3
  SAY @45008 /* This action can not be undone. Are you certain? */
  ++ @45009 /* Yes! */ DO ~ApplySpellRES("a7!in01", Myself)~ EXIT
  ++ @45010 /* No! */ EXIT
END

IF ~~ Golem.Limit.Reached
  SAY @45012 /* You cannot have any more golems following you. */
  IF ~~ + Golem.2
END

IF ~~ Golem.KillCount
  SAY @45015 /* Opponents killed by this creature: <A7_GOLEMKILLS> */
  IF ~~ + Golem.2
END

IF ~~ Golem.Upgrade
  SAY @45016 /* You prepare the golem for the upgrade process... */
  IF ~GlobalLT("Command", "LOCALS", 1)~
    DO ~SetGlobal("A7!GolemUpgradeCommand", "GLOBAL", 0) SetGlobal("A7!KillCount", "LOCALS", 0) SetGlobal("A7!Promote", "LOCALS", 0) CreateCreatureObject("a7!upgr", Myself, 0, 0, 0) StartCutSceneMode() StartCutSceneEx("a7!ct90", TRUE)~ EXIT
  IF ~Global("Command", "LOCALS", 1)~
    DO ~SetGlobal("A7!GolemUpgradeCommand", "GLOBAL", 1) SetGlobal("A7!KillCount", "LOCALS", 0) SetGlobal("A7!Promote", "LOCALS", 0) CreateCreatureObject("a7!upgr", Myself, 0, 0, 0) StartCutSceneMode() StartCutSceneEx("a7!ct90", TRUE)~ EXIT
  IF ~Global("Command", "LOCALS", 2)~
    DO ~SetGlobal("A7!GolemUpgradeCommand", "GLOBAL", 2) SetGlobal("A7!KillCount", "LOCALS", 0) SetGlobal("A7!Promote", "LOCALS", 0) CreateCreatureObject("a7!upgr", Myself, 0, 0, 0) StartCutSceneMode() StartCutSceneEx("a7!ct90", TRUE)~ EXIT
  IF ~GlobalGT("Command", "LOCALS", 2)~
    DO ~SetGlobal("A7!GolemUpgradeCommand", "GLOBAL", 3) SetGlobal("A7!KillCount", "LOCALS", 0) SetGlobal("A7!Promote", "LOCALS", 0) CreateCreatureObject("a7!upgr", Myself, 0, 0, 0) StartCutSceneMode() StartCutSceneEx("a7!ct90", TRUE)~ EXIT
END
