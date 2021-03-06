// *** Helper creature: Golem Crafting (IWDEE) ***

BEGIN ~a7!smdlg~

IF ~Global("stage", "LOCALS", 0)~ Golem.Prepare
  SAY @41009 /* You prepare yourself for the task before you... */
  IF ~!GlobalGT("A7!GolemCount", "GLOBAL", %max_golem_count%) Global("initCancelled", "LOCALS", 1)~ DO ~SetGlobal("stage", "LOCALS", -1) SetTokenGlobal("A7!GolemCount", "GLOBAL", "A7GLCNT") StartCutSceneMode() StartCutScene("a7!ct00")~ EXIT
  IF ~!GlobalGT("A7!GolemCount", "GLOBAL", %max_golem_count%) Global("initDragonsEye", "LOCALS", 1)~ DO ~SetGlobal("stage", "LOCALS", 1) SetTokenGlobal("A7!GolemCount", "GLOBAL", "A7GLCNT") StartCutSceneMode() StartCutScene("a7!ct30")~ EXIT
  IF ~!GlobalGT("A7!GolemCount", "GLOBAL", %max_golem_count%) Global("initSeveredHand", "LOCALS", 1)~ DO ~SetGlobal("stage", "LOCALS", 1) SetTokenGlobal("A7!GolemCount", "GLOBAL", "A7GLCNT") StartCutSceneMode() StartCutScene("a7!ct31")~ EXIT
  IF ~!GlobalGT("A7!GolemCount", "GLOBAL", %max_golem_count%) Global("initDornsDeep", "LOCALS", 1)~ DO ~SetGlobal("stage", "LOCALS", 1) SetTokenGlobal("A7!GolemCount", "GLOBAL", "A7GLCNT") StartCutSceneMode() StartCutScene("a7!ct32")~ EXIT
  IF ~!GlobalGT("A7!GolemCount", "GLOBAL", %max_golem_count%) Global("initLowerDornsDeep", "LOCALS", 1)~ DO ~SetGlobal("stage", "LOCALS", 1) SetTokenGlobal("A7!GolemCount", "GLOBAL", "A7GLCNT") StartCutSceneMode() StartCutScene("a7!ct33")~ EXIT
  IF ~!GlobalGT("A7!GolemCount", "GLOBAL", %max_golem_count%) Global("initGloomfrost", "LOCALS", 1)~ DO ~SetGlobal("stage", "LOCALS", 1) SetTokenGlobal("A7!GolemCount", "GLOBAL", "A7GLCNT") StartCutSceneMode() StartCutScene("a7!ct34")~ EXIT
  IF ~!GlobalGT("A7!GolemCount", "GLOBAL", %max_golem_count%) Global("initMaluradek", "LOCALS", 1)~ DO ~SetGlobal("stage", "LOCALS", 1) SetTokenGlobal("A7!GolemCount", "GLOBAL", "A7GLCNT") StartCutSceneMode() StartCutScene("a7!ct35")~ EXIT
  IF ~!GlobalGT("A7!GolemCount", "GLOBAL", %max_golem_count%) Global("A7!Debug", "GLOBAL", 1)~ DO ~SetGlobal("stage", "LOCALS", 1) SetTokenGlobal("A7!GolemCount", "GLOBAL", "A7GLCNT") StartCutSceneMode() StartCutScene("a7!ct00")~ EXIT
  IF ~GlobalGT("A7!GolemCount", "GLOBAL", %max_golem_count%)~ DO ~SetGlobal("stage", "LOCALS", -2) SetTokenGlobal("A7!GolemCount", "GLOBAL", "A7GLCNT") StartCutSceneMode() StartCutScene("a7!ct00")~ EXIT
  IF ~GlobalTimerNotExpired("A7!GolemCountTimer", "GLOBAL")~ + Golem.Counter.Active
END

IF ~Global("stage", "LOCALS", 1)~ Golem.Type
  SAY @41000  /* Select golem type: */
  + ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemFlesh", "LOCALS", 1)~ + @41001 /* Flesh Golem */ + Golem.Type.Flesh
  + ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemClay", "LOCALS", 1)~ + @41002 /* Clay Golem */ + Golem.Type.Clay
  + ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemStone", "LOCALS", 1)~ + @41003 /* Stone Golem */ + Golem.Type.Stone
  + ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemIron", "LOCALS", 1)~ + @41004 /* Iron Golem */ + Golem.Type.Iron
  + ~Global("A7!TomeGolemIron", "GLOBAL", 1) NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemMithral", "LOCALS", 1)~ + @41005 /* Mithral Golem */ + Golem.Type.Mithral
  + ~!Global("A7!TomeGolemIron", "GLOBAL", 1) NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemMithral", "LOCALS", 1)~ + @41005 /* Mithral Golem */ + Golem.Type.Mithral.Denied
  + ~OR(7)
       NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemBone", "LOCALS", 1)
       NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemIce", "LOCALS", 1)
       NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemLightning", "LOCALS", 1)
       NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemRuby", "LOCALS", 1)~ + @41007 /* Exotic Golem */ + Golem.Type.Exotic
  ++ @41051 /* List available golem types */ + Golem.List.Init
  ++ @41053 /* Fix: Reset golem counter (active golems: <A7GLCNT>) */ DO ~ SetGlobal("A7!GolemCount", "GLOBAL", 0) SetGlobalTimer("A7!GolemCountTimer", "GLOBAL", 12) DestroySelf()~ EXIT
  ++ @41016 /* Cancel construction */ DO ~DestroySelf()~ EXIT
END

IF ~~ Golem.List.Init
  SAY @41052 /* The following golem types have been learned by <GABBER>: */
  IF ~True()~ DO ~DestroySelf()~ EXIT
  IF ~Global("stage", "LOCALS", 1)~ + Golem.Type
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemRuby", "LOCALS", 1)~ + Golem.List.Exotic.Ruby
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemLightning", "LOCALS", 1)~ + Golem.List.Exotic.Lightning
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemIce", "LOCALS", 1)~ + Golem.List.Exotic.Ice
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemBone", "LOCALS", 1)~ + Golem.List.Exotic.Bone
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemMithral", "LOCALS", 1)~ + Golem.List.Mithral
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemIron", "LOCALS", 1)~ + Golem.List.Iron
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemStone", "LOCALS", 1)~ + Golem.List.Stone
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemClay", "LOCALS", 1)~ + Golem.List.Clay
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemFlesh", "LOCALS", 1)~ + Golem.List.Flesh
END

IF ~~ Golem.List.Flesh
  SAY @41001 /* Flesh Golem */
  IF ~True()~ DO ~DestroySelf()~ EXIT
  IF ~Global("stage", "LOCALS", 1)~ + Golem.Type
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemRuby", "LOCALS", 1)~ + Golem.List.Exotic.Ruby
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemLightning", "LOCALS", 1)~ + Golem.List.Exotic.Lightning
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemIce", "LOCALS", 1)~ + Golem.List.Exotic.Ice
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemBone", "LOCALS", 1)~ + Golem.List.Exotic.Bone
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemMithral", "LOCALS", 1)~ + Golem.List.Mithral
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemIron", "LOCALS", 1)~ + Golem.List.Iron
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemStone", "LOCALS", 1)~ + Golem.List.Stone
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemClay", "LOCALS", 1)~ + Golem.List.Clay
END

IF ~~ Golem.List.Clay
  SAY @41002 /* Clay Golem */
  IF ~True()~ DO ~DestroySelf()~ EXIT
  IF ~Global("stage", "LOCALS", 1)~ + Golem.Type
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemRuby", "LOCALS", 1)~ + Golem.List.Exotic.Ruby
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemLightning", "LOCALS", 1)~ + Golem.List.Exotic.Lightning
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemIce", "LOCALS", 1)~ + Golem.List.Exotic.Ice
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemBone", "LOCALS", 1)~ + Golem.List.Exotic.Bone
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemMithral", "LOCALS", 1)~ + Golem.List.Mithral
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemIron", "LOCALS", 1)~ + Golem.List.Iron
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemStone", "LOCALS", 1)~ + Golem.List.Stone
END

IF ~~ Golem.List.Stone
  SAY @41003 /* Stone Golem */
  IF ~True()~ DO ~DestroySelf()~ EXIT
  IF ~Global("stage", "LOCALS", 1)~ + Golem.Type
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemRuby", "LOCALS", 1)~ + Golem.List.Exotic.Ruby
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemLightning", "LOCALS", 1)~ + Golem.List.Exotic.Lightning
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemIce", "LOCALS", 1)~ + Golem.List.Exotic.Ice
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemBone", "LOCALS", 1)~ + Golem.List.Exotic.Bone
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemMithral", "LOCALS", 1)~ + Golem.List.Mithral
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemIron", "LOCALS", 1)~ + Golem.List.Iron
END

IF ~~ Golem.List.Iron
  SAY @41004 /* Iron Golem */
  IF ~True()~ DO ~DestroySelf()~ EXIT
  IF ~Global("stage", "LOCALS", 1)~ + Golem.Type
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemRuby", "LOCALS", 1)~ + Golem.List.Exotic.Ruby
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemLightning", "LOCALS", 1)~ + Golem.List.Exotic.Lightning
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemIce", "LOCALS", 1)~ + Golem.List.Exotic.Ice
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemBone", "LOCALS", 1)~ + Golem.List.Exotic.Bone
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemMithral", "LOCALS", 1)~ + Golem.List.Mithral
END

IF ~~ Golem.List.Mithral
  SAY @41005 /* Mithral Golem */
  IF ~True()~ DO ~DestroySelf()~ EXIT
  IF ~Global("stage", "LOCALS", 1)~ + Golem.Type
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemRuby", "LOCALS", 1)~ + Golem.List.Exotic.Ruby
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemLightning", "LOCALS", 1)~ + Golem.List.Exotic.Lightning
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemIce", "LOCALS", 1)~ + Golem.List.Exotic.Ice
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemBone", "LOCALS", 1)~ + Golem.List.Exotic.Bone
END

IF ~~ Golem.List.Exotic.Bone
  SAY @41038 /* Bone Golem */
  IF ~True()~ DO ~DestroySelf()~ EXIT
  IF ~Global("stage", "LOCALS", 1)~ + Golem.Type
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemRuby", "LOCALS", 1)~ + Golem.List.Exotic.Ruby
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemLightning", "LOCALS", 1)~ + Golem.List.Exotic.Lightning
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemIce", "LOCALS", 1)~ + Golem.List.Exotic.Ice
END

IF ~~ Golem.List.Exotic.Ice
  SAY @41040 /* Ice Golem */
  IF ~True()~ DO ~DestroySelf()~ EXIT
  IF ~Global("stage", "LOCALS", 1)~ + Golem.Type
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemRuby", "LOCALS", 1)~ + Golem.List.Exotic.Ruby
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemLightning", "LOCALS", 1)~ + Golem.List.Exotic.Lightning
END

IF ~~ Golem.List.Exotic.Lightning
  SAY @41042 /* Lightning Golem */
  IF ~True()~ DO ~DestroySelf()~ EXIT
  IF ~Global("stage", "LOCALS", 1)~ + Golem.Type
  IF ~NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemRuby", "LOCALS", 1)~ + Golem.List.Exotic.Ruby
END

IF ~~ Golem.List.Exotic.Ruby
  SAY @41049 /* Ruby Golem */
  IF ~True()~ DO ~DestroySelf()~ EXIT
  IF ~Global("stage", "LOCALS", 1)~ + Golem.Type
END


IF ~Global("stage", "LOCALS", 2) Global("GolemVariant", "LOCALS", 1)~ Golem.Type.Finished.Lesser
  SAY @41008 /* After <A7_HOURS> hours of hard work the physical shell of the golem is ready for the final enchantment... */
  IF ~True()~ DO ~DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 1)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smfl1", Myself)) DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 2)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smcl1", Myself)) DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 3)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smst1", Myself)) DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 4)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smir1", Myself)) DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 5)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smmi1", Myself)) DestroySelf()~ EXIT
END

IF ~Global("stage", "LOCALS", 2) Global("GolemVariant", "LOCALS", 2)~ Golem.Type.Finished.Regular
  SAY @41008 /* After <A7_HOURS> hours of hard work the physical shell of the golem is ready for the final enchantment... */
  IF ~True()~ DO ~DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 1)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smfl2", Myself)) DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 2)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smcl2", Myself)) DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 3)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smst2", Myself)) DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 4)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smir2", Myself)) DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 5)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smmi2", Myself)) DestroySelf()~ EXIT
END

IF ~Global("stage", "LOCALS", 2) Global("GolemVariant", "LOCALS", 3)~ Golem.Type.Finished.Greater
  SAY @41008 /* After <A7_HOURS> hours of hard work the physical shell of the golem is ready for the final enchantment... */
  IF ~True()~ DO ~DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 1)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smfl3", Myself)) DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 2)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smcl3", Myself)) DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 3)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smst3", Myself)) DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 4)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smir3", Myself)) DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 5)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smmi3", Myself)) DestroySelf()~ EXIT
END

IF ~Global("stage", "LOCALS", 2) Global("GolemVariant", "LOCALS", 4)~ Golem.Type.Finished.Perfect
  SAY @41008 /* After <A7_HOURS> hours of hard work the physical shell of the golem is ready for the final enchantment... */
  IF ~True()~ DO ~DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 1)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smfl4", Myself)) DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 2)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smcl4", Myself)) DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 3)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smst4", Myself)) DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 4)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smir4", Myself)) DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 5)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smmi4", Myself)) DestroySelf()~ EXIT
END

IF ~Global("stage", "LOCALS", 2) Global("GolemVariant", "LOCALS", 9)~ Golem.Type.Finished.Exotic
  SAY @41008 /* After <A7_HOURS> hours of hard work the physical shell of the golem is ready for the final enchantment... */
  IF ~True()~ DO ~DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 8)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smbo", Myself)) DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 10)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smic", Myself)) DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 12)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smlt", Myself)) DestroySelf()~ EXIT
  IF ~Global("GolemType", "LOCALS", 13)~ DO ~ActionOverride(LastTalkedToBy, ForceSpellRES("a7!smru", Myself)) DestroySelf()~ EXIT
END

IF ~Global("stage", "LOCALS", -2)~ Golem.Limit.Reached
  SAY @41050 /* You cannot have any more golems following you. */
  ++ @41051 /* List available golem types */ + Golem.List.Init
  ++ @41053 /* Fix: Reset golem counter (active golems: <A7GLCNT>) */ DO ~ SetGlobal("A7!GolemCount", "GLOBAL", 0) SetGlobalTimer("A7!GolemCountTimer", "GLOBAL", 12) DestroySelf()~ EXIT
  ++ @41016 /* Cancel construction */ DO ~DestroySelf()~ EXIT
END


IF ~~ Golem.Counter.Active
  SAY @41054 /* The counter reset is still in process. You have to try again later. */
  IF ~~ DO ~DestroySelf()~ EXIT
END


IF ~~ Golem.Type.Flesh
  SAY @41011 /* Select golem variant: */
  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 3) PartyHasItem("a7!body")~ + @41012 /* Lesser Flesh Golem */ + Golem.Type.Flesh.Lesser
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 4) PartyHasItem("a7!body")~ + @41012 /* Lesser Flesh Golem */ + Golem.Type.Flesh.Lesser
  + ~Class(LastTalkedToBy, BARD_ALL) LevelGT(LastTalkedToBy, 5) PartyHasItem("a7!body")~ + @41012 /* Lesser Flesh Golem */ + Golem.Type.Flesh.Lesser

  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 5) NumItemsPartyGT("a7!body", 1)~ + @41013 /* Flesh Golem */ + Golem.Type.Flesh.Regular
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 6) NumItemsPartyGT("a7!body", 1)~ + @41013 /* Flesh Golem */ + Golem.Type.Flesh.Regular
  + ~Class(LastTalkedToBy, BARD_ALL) LevelGT(LastTalkedToBy, 7) NumItemsPartyGT("a7!body", 1)~ + @41013 /* Flesh Golem */ + Golem.Type.Flesh.Regular

  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 7) NumItemsPartyGT("a7!body", 3) PartyHasItem("scrl97")~ + @41014 /* Greater Flesh Golem */ + Golem.Type.Flesh.Greater
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 9) NumItemsPartyGT("a7!body", 3) PartyHasItem("scrl97")~ + @41014 /* Greater Flesh Golem */ + Golem.Type.Flesh.Greater
  + ~Class(LastTalkedToBy, BARD_ALL) LevelGT(LastTalkedToBy, 11) NumItemsPartyGT("a7!body", 3) PartyHasItem("scrl97")~ + @41014 /* Greater Flesh Golem */ + Golem.Type.Flesh.Greater

  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 9) NumItemsPartyGT("a7!body", 3) PartyHasItem("scrl97") PartyHasItem("a7!glfl")~ + @41015 /* Perfect Flesh Golem */ + Golem.Type.Flesh.Perfect
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 11) NumItemsPartyGT("a7!body", 3) PartyHasItem("scrl97") PartyHasItem("a7!glfl")~ + @41015 /* Perfect Flesh Golem */ + Golem.Type.Flesh.Perfect
  + ~Class(LastTalkedToBy, BARD_ALL) LevelGT(LastTalkedToBy, 13) NumItemsPartyGT("a7!body", 3) PartyHasItem("scrl97") PartyHasItem("a7!glfl")~ + @41015 /* Perfect Flesh Golem */ + Golem.Type.Flesh.Perfect

  ++ @41048 /* Select different golem type */ + Golem.Type
  ++ @41016 /* Cancel construction */ DO ~DestroySelf()~ EXIT
END

IF ~~ Golem.Type.Clay
  SAY @41017 /* Select golem variant: */
  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 5) PartyHasItem("a7!clay")~ + @41018 /* Lesser Clay Golem */ + Golem.Type.Clay.Lesser
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 6) PartyHasItem("a7!clay")~ + @41018 /* Lesser Clay Golem */ + Golem.Type.Clay.Lesser
  + ~Class(LastTalkedToBy, BARD_ALL) LevelGT(LastTalkedToBy, 7) PartyHasItem("a7!clay")~ + @41018 /* Lesser Clay Golem */ + Golem.Type.Clay.Lesser

  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 7) NumItemsPartyGT("a7!clay", 1) PartyHasItem("scrl1h")~ + @41019 /* Clay Golem */ + Golem.Type.Clay.Regular
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 9) NumItemsPartyGT("a7!clay", 1) PartyHasItem("scrl1h")~ + @41019 /* Clay Golem */ + Golem.Type.Clay.Regular
  + ~Class(LastTalkedToBy, BARD_ALL) LevelGT(LastTalkedToBy, 11) NumItemsPartyGT("a7!clay", 1) PartyHasItem("scrl1h")~ + @41019 /* Clay Golem */ + Golem.Type.Clay.Regular

  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 10) NumItemsPartyGT("a7!clay", 3) PartyHasItem("scrl1h")~ + @41020 /* Greater Clay Golem */ + Golem.Type.Clay.Greater
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 12) NumItemsPartyGT("a7!clay", 3) PartyHasItem("scrl1h")~ + @41020 /* Greater Clay Golem */ + Golem.Type.Clay.Greater
  + ~Class(LastTalkedToBy, BARD_ALL) LevelGT(LastTalkedToBy, 15) NumItemsPartyGT("a7!clay", 3) PartyHasItem("scrl1h")~ + @41020 /* Greater Clay Golem */ + Golem.Type.Clay.Greater

  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 12) NumItemsPartyGT("a7!clay", 3) PartyHasItem("scrl1h") PartyHasItem("a7!glcl")~ + @41021 /* Perfect Clay Golem */ + Golem.Type.Clay.Perfect
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 14) NumItemsPartyGT("a7!clay", 3) PartyHasItem("scrl1h") PartyHasItem("a7!glcl")~ + @41021 /* Perfect Clay Golem */ + Golem.Type.Clay.Perfect
  + ~Class(LastTalkedToBy, BARD_ALL) LevelGT(LastTalkedToBy, 18) NumItemsPartyGT("a7!clay", 3) PartyHasItem("scrl1h") PartyHasItem("a7!glcl")~ + @41021 /* Perfect Clay Golem */ + Golem.Type.Clay.Perfect

  ++ @41048 /* Select different golem type */ + Golem.Type
  ++ @41016 /* Cancel construction */ DO ~DestroySelf()~ EXIT
END

IF ~~ Golem.Type.Stone
  SAY @41017 /* Select golem variant: */
  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 5) PartyHasItem("a7!ston")~ + @41022 /* Lesser Stone Golem */ + Golem.Type.Stone.Lesser
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 6) PartyHasItem("a7!ston")~ + @41022 /* Lesser Stone Golem */ + Golem.Type.Stone.Lesser
  + ~Class(LastTalkedToBy, BARD_ALL) LevelGT(LastTalkedToBy, 7) PartyHasItem("a7!ston")~ + @41022 /* Lesser Stone Golem */ + Golem.Type.Stone.Lesser

  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 7) NumItemsPartyGT("a7!ston", 1) PartyHasItem("scrl1o")~ + @41023 /* Stone Golem */ + Golem.Type.Stone.Regular
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 9) NumItemsPartyGT("a7!ston", 1) PartyHasItem("scrl1o")~ + @41023 /* Stone Golem */ + Golem.Type.Stone.Regular
  + ~Class(LastTalkedToBy, BARD_ALL) LevelGT(LastTalkedToBy, 11) NumItemsPartyGT("a7!ston", 1) PartyHasItem("scrl1o")~ + @41023 /* Stone Golem */ + Golem.Type.Stone.Regular

  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 10) NumItemsPartyGT("a7!ston", 3) PartyHasItem("scrl1o")~ + @41024 /* Greater Stone Golem */ + Golem.Type.Stone.Greater
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 12) NumItemsPartyGT("a7!ston", 3) PartyHasItem("scrl1o")~ + @41024 /* Greater Stone Golem */ + Golem.Type.Stone.Greater
  + ~Class(LastTalkedToBy, BARD_ALL) LevelGT(LastTalkedToBy, 15) NumItemsPartyGT("a7!ston", 3) PartyHasItem("scrl1o")~ + @41024 /* Greater Stone Golem */ + Golem.Type.Stone.Greater

  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 12) NumItemsPartyGT("a7!ston", 3) PartyHasItem("scrl1o") PartyHasItem("a7!glst")~ + @41025 /* Perfect Stone Golem */ + Golem.Type.Stone.Perfect
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 14) NumItemsPartyGT("a7!ston", 3) PartyHasItem("scrl1o") PartyHasItem("a7!glst")~ + @41025 /* Perfect Stone Golem */ + Golem.Type.Stone.Perfect
  + ~Class(LastTalkedToBy, BARD_ALL) LevelGT(LastTalkedToBy, 18) NumItemsPartyGT("a7!ston", 3) PartyHasItem("scrl1o") PartyHasItem("a7!glst")~ + @41025 /* Perfect Stone Golem */ + Golem.Type.Stone.Perfect

  ++ @41048 /* Select different golem type */ + Golem.Type
  ++ @41016 /* Cancel construction */ DO ~DestroySelf()~ EXIT
END

IF ~~ Golem.Type.Iron
  SAY @41017 /* Select golem variant: */
  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 8) PartyHasItem("a7!iron")~ + @41026 /* Lesser Iron Golem */ + Golem.Type.Iron.Lesser
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 10) PartyHasItem("a7!iron")~ + @41026 /* Lesser Iron Golem */ + Golem.Type.Iron.Lesser
  + ~Class(LastTalkedToBy, BARD_ALL) LevelGT(LastTalkedToBy, 12) PartyHasItem("a7!iron")~ + @41026 /* Lesser Iron Golem */ + Golem.Type.Iron.Lesser

  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 11) NumItemsPartyGT("a7!iron", 1) PartyHasItem("scrl2e")~ + @41027 /* Iron Golem */ + Golem.Type.Iron.Regular
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 13) NumItemsPartyGT("a7!iron", 1) PartyHasItem("scrl2e")~ + @41027 /* Iron Golem */ + Golem.Type.Iron.Regular
  + ~Class(LastTalkedToBy, BARD_ALL) LevelGT(LastTalkedToBy, 17) NumItemsPartyGT("a7!iron", 1) PartyHasItem("scrl2e")~ + @41027 /* Iron Golem */ + Golem.Type.Iron.Regular

  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 14) NumItemsPartyGT("a7!iron", 3) PartyHasItem("scrl2e")~ + @41028 /* Greater Iron Golem */ + Golem.Type.Iron.Greater
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 16) NumItemsPartyGT("a7!iron", 3) PartyHasItem("scrl2e")~ + @41028 /* Greater Iron Golem */ + Golem.Type.Iron.Greater
  + ~Class(LastTalkedToBy, BARD_ALL) LevelGT(LastTalkedToBy, 21) NumItemsPartyGT("a7!iron", 3) PartyHasItem("scrl2e")~ + @41028 /* Greater Iron Golem */ + Golem.Type.Iron.Greater

  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 16) NumItemsPartyGT("a7!iron", 3) PartyHasItem("scrl2e") PartyHasItem("a7!glir")~ + @41029 /* Perfect Iron Golem */ + Golem.Type.Iron.Perfect
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 18) NumItemsPartyGT("a7!iron", 3) PartyHasItem("scrl2e") PartyHasItem("a7!glir")~ + @41029 /* Perfect Iron Golem */ + Golem.Type.Iron.Perfect

  ++ @41048 /* Select different golem type */ + Golem.Type
  ++ @41016 /* Cancel construction */ DO ~DestroySelf()~ EXIT
END

IF ~~ Golem.Type.Mithral
  SAY @41017 /* Select golem variant: */
  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 10) PartyHasItem("a7!mith")~ + @41030 /* Lesser Mithral Golem */ + Golem.Type.Mithral.Lesser
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 12) PartyHasItem("a7!mith")~ + @41030 /* Lesser Mithral Golem */ + Golem.Type.Mithral.Lesser
  + ~Class(LastTalkedToBy, BARD_ALL) LevelGT(LastTalkedToBy, 15) PartyHasItem("a7!mith")~ + @41030 /* Lesser Mithral Golem */ + Golem.Type.Mithral.Lesser

  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 14) NumItemsPartyGT("a7!mith", 1)~ + @41031 /* Mithral Golem */ + Golem.Type.Mithral.Regular
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 16) NumItemsPartyGT("a7!mith", 1)~ + @41031 /* Mithral Golem */ + Golem.Type.Mithral.Regular
  + ~Class(LastTalkedToBy, BARD_ALL) LevelGT(LastTalkedToBy, 21) NumItemsPartyGT("a7!mith", 1)~ + @41031 /* Mithral Golem */ + Golem.Type.Mithral.Regular

  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 18) NumItemsPartyGT("a7!mith", 3)~ + @41032 /* Greater Mithral Golem */ + Golem.Type.Mithral.Greater
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 20) NumItemsPartyGT("a7!mith", 3)~ + @41032 /* Greater Mithral Golem */ + Golem.Type.Mithral.Greater

  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 20) NumItemsPartyGT("a7!mith", 3) PartyHasItemIdentified("a7!glmi")~ + @41033 /* Perfect Mithral Golem */ + Golem.Type.Mithral.Perfect
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 22) NumItemsPartyGT("a7!mith", 3) PartyHasItemIdentified("a7!glmi")~ + @41033 /* Perfect Mithral Golem */ + Golem.Type.Mithral.Perfect

  ++ @41048 /* Select different golem type */ + Golem.Type
  ++ @41016 /* Cancel construction */ DO ~DestroySelf()~ EXIT
END

IF ~~ Golem.Type.Mithral.Denied
  SAY @41046 /* You can't construct Mithral Golems without having studied the principles of Iron Golem construction. */
  ++ @41048 /* Select different golem type */ + Golem.Type
  ++ @41016 /* Cancel construction */ DO ~DestroySelf()~ EXIT
END

IF ~~ Golem.Type.Exotic
  SAY @41017 /* Select golem variant: */
  + ~OR(2) Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Kit(LastTalkedToBy, MAGESCHOOL_NECROMANCER) LevelGT(LastTalkedToBy, 9)
     NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemBone", "LOCALS", 1) NumItemsPartyGT("a7!bone", 3) PartyHasItem("scrl2d")~ + @41038 /* Bone Golem */ + Golem.Type.Bone
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) !Kit(LastTalkedToBy, MAGESCHOOL_NECROMANCER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 11)
     NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemBone", "LOCALS", 1) NumItemsPartyGT("a7!bone", 3) PartyHasItem("scrl2d")~ + @41038 /* Bone Golem */ + Golem.Type.Bone
  + ~Class(LastTalkedToBy, BARD_ALL) LevelGT(LastTalkedToBy, 13)
     NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemBone", "LOCALS", 1) NumItemsPartyGT("a7!bone", 3) PartyHasItem("scrl2d")~ + @41038 /* Bone Golem */ + Golem.Type.Bone

  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 11)
     NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemIce", "LOCALS", 1) PartyHasItem("a7!ice") PartyHasItem("scrl2f") OR(2) PartyHasItem("scrl04") PartyHasItem("scrl6i")~ + @41040 /* Ice Golem */ + Golem.Type.Ice
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 13)
     NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemIce", "LOCALS", 1) PartyHasItem("a7!ice") PartyHasItem("scrl2f") OR(2) PartyHasItem("scrl04") PartyHasItem("scrl6i")~ + @41040 /* Ice Golem */ + Golem.Type.Ice
  + ~Class(LastTalkedToBy, BARD_ALL) LevelGT(LastTalkedToBy, 16)
     NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemIce", "LOCALS", 1) PartyHasItem("a7!ice") PartyHasItem("scrl2f") OR(2) PartyHasItem("scrl04") PartyHasItem("scrl6i")~ + @41040 /* Ice Golem */ + Golem.Type.Ice

  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 14)
     NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemLightning", "LOCALS", 1) PartyGoldGT(99999) PartyHasItem("scclite")~ + @41042 /* Lightning Golem */ + Golem.Type.Lightning
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 16)
     NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemLightning", "LOCALS", 1) PartyGoldGT(99999) PartyHasItem("scclite")~ + @41042 /* Lightning Golem */ + Golem.Type.Lightning
  + ~Class(LastTalkedToBy, BARD_ALL) LevelGT(LastTalkedToBy, 21)
     NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemLightning", "LOCALS", 1) PartyGoldGT(99999) PartyHasItem("scclite")~ + @41042 /* Lightning Golem */ + Golem.Type.Lightning

  + ~Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) LevelGT(LastTalkedToBy, 13)
     NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemRuby", "LOCALS", 1) NumItemsPartyGT("a7!ruby", 3) NumItemsPartyGT("misc16", 1) PartyHasItem("scrl8g")~ + @41049 /* Ruby Golem */ + Golem.Type.Ruby
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_TRANSMUTER) Class(LastTalkedToBy, MAGE_ALL) LevelGT(LastTalkedToBy, 15)
     NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemRuby", "LOCALS", 1) NumItemsPartyGT("a7!ruby", 3) NumItemsPartyGT("misc16", 1) PartyHasItem("scrl8g")~ + @41049 /* Ruby Golem */ + Golem.Type.Ruby
  + ~Class(LastTalkedToBy, BARD_ALL) LevelGT(LastTalkedToBy, 19)
     NextTriggerObject(LastTalkedToBy) Global("A7!TomeGolemRuby", "LOCALS", 1) NumItemsPartyGT("a7!ruby", 3) NumItemsPartyGT("misc16", 1) PartyHasItem("scrl8g")~ + @41049 /* Ruby Golem */ + Golem.Type.Ruby

  ++ @41048 /* Select different golem type */ + Golem.Type
  ++ @41016 /* Cancel construction */ DO ~DestroySelf()~ EXIT
END

IF ~Global("stage", "LOCALS", -1)~ Golem.Location.Cancelled
  SAY @41010 /* ...but are unable to do so in this location. */
  ++ @41051 /* List available golem types */ + Golem.List.Init
  ++ @41053 /* Fix: Reset golem counter (active golems: <A7GLCNT>) */ DO ~ SetGlobal("A7!GolemCount", "GLOBAL", 0) SetGlobalTimer("A7!GolemCountTimer", "GLOBAL", 12) DestroySelf()~ EXIT
  ++ @41016 /* Cancel construction */ DO ~DestroySelf()~ EXIT
END


IF ~~ Golem.Type.Flesh.Lesser
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 1) SetGlobal("GolemVariant", "LOCALS", 1)
            TakePartyItemNum("a7!body", 1) DestroyItem("a7!body")
            StartCutSceneMode() StartCutScene("a7!ct01")~ EXIT
END

IF ~~ Golem.Type.Flesh.Regular
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 1) SetGlobal("GolemVariant", "LOCALS", 2)
            TakePartyItemNum("a7!body", 2) DestroyItem("a7!body") DestroyItem("a7!body")
            StartCutSceneMode() StartCutScene("a7!ct02")~ EXIT
END

IF ~~ Golem.Type.Flesh.Greater
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 1) SetGlobal("GolemVariant", "LOCALS", 3)
            TakePartyItemNum("a7!body", 4) DestroyItem("a7!body") DestroyItem("a7!body") DestroyItem("a7!body") DestroyItem("a7!body")
            TakePartyItemNum("scrl97", 1) DestroyItem("scrl97")
            StartCutSceneMode() StartCutScene("a7!ct03")~ EXIT
END

IF ~~ Golem.Type.Flesh.Perfect
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 1) SetGlobal("GolemVariant", "LOCALS", 4)
            TakePartyItemNum("a7!body", 4) DestroyItem("a7!body") DestroyItem("a7!body") DestroyItem("a7!body") DestroyItem("a7!body")
            TakePartyItemNum("scrl97", 1) DestroyItem("scrl97")
            TakePartyItemNum("a7!glfl", 1) DestroyItem("a7!glfl")
            StartCutSceneMode() StartCutScene("a7!ct03")~ EXIT
END


IF ~~ Golem.Type.Clay.Lesser
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 2) SetGlobal("GolemVariant", "LOCALS", 1)
            TakePartyItemNum("a7!clay", 1) DestroyItem("a7!clay")
            StartCutSceneMode() StartCutScene("a7!ct01")~ EXIT
END

IF ~~ Golem.Type.Clay.Regular
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 2) SetGlobal("GolemVariant", "LOCALS", 2)
            TakePartyItemNum("a7!clay", 2) DestroyItem("a7!clay") DestroyItem("a7!clay")
            TakePartyItemNum("scrl1h", 1) DestroyItem("scrl1h")
            StartCutSceneMode() StartCutScene("a7!ct02")~ EXIT
END

IF ~~ Golem.Type.Clay.Greater
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 2) SetGlobal("GolemVariant", "LOCALS", 3)
            TakePartyItemNum("a7!clay", 4) DestroyItem("a7!clay") DestroyItem("a7!clay") DestroyItem("a7!clay") DestroyItem("a7!clay")
            TakePartyItemNum("scrl1h", 1) DestroyItem("scrl1h")
            StartCutSceneMode() StartCutScene("a7!ct03")~ EXIT
END

IF ~~ Golem.Type.Clay.Perfect
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 2) SetGlobal("GolemVariant", "LOCALS", 4)
            TakePartyItemNum("a7!clay", 4) DestroyItem("a7!clay") DestroyItem("a7!clay") DestroyItem("a7!clay") DestroyItem("a7!clay")
            TakePartyItemNum("scrl1h", 1) DestroyItem("scrl1h")
            TakePartyItemNum("a7!glcl", 1) DestroyItem("a7!glcl")
            StartCutSceneMode() StartCutScene("a7!ct03")~ EXIT
END


IF ~~ Golem.Type.Stone.Lesser
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 3) SetGlobal("GolemVariant", "LOCALS", 1)
            TakePartyItemNum("a7!ston", 1) DestroyItem("a7!ston")
            StartCutSceneMode() StartCutScene("a7!ct01")~ EXIT
END

IF ~~ Golem.Type.Stone.Regular
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 3) SetGlobal("GolemVariant", "LOCALS", 2)
            TakePartyItemNum("a7!ston", 2) DestroyItem("a7!ston") DestroyItem("a7!ston")
            TakePartyItemNum("scrl1o", 1) DestroyItem("scrl1o")
            StartCutSceneMode() StartCutScene("a7!ct02")~ EXIT
END

IF ~~ Golem.Type.Stone.Greater
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 3) SetGlobal("GolemVariant", "LOCALS", 3)
            TakePartyItemNum("a7!ston", 4) DestroyItem("a7!ston") DestroyItem("a7!ston") DestroyItem("a7!ston") DestroyItem("a7!ston")
            TakePartyItemNum("scrl1o", 1) DestroyItem("scrl1o")
            StartCutSceneMode() StartCutScene("a7!ct03")~ EXIT
END

IF ~~ Golem.Type.Stone.Perfect
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 3) SetGlobal("GolemVariant", "LOCALS", 4)
            TakePartyItemNum("a7!ston", 4) DestroyItem("a7!ston") DestroyItem("a7!ston") DestroyItem("a7!ston") DestroyItem("a7!ston")
            TakePartyItemNum("scrl1o", 1) DestroyItem("scrl1o")
            TakePartyItemNum("a7!glst", 1) DestroyItem("a7!glst")
            StartCutSceneMode() StartCutScene("a7!ct03")~ EXIT
END


IF ~~ Golem.Type.Iron.Lesser
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 4) SetGlobal("GolemVariant", "LOCALS", 1)
            TakePartyItemNum("a7!iron", 1) DestroyItem("a7!iron")
            StartCutSceneMode() StartCutScene("a7!ct02")~ EXIT
END

IF ~~ Golem.Type.Iron.Regular
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 4) SetGlobal("GolemVariant", "LOCALS", 2)
            TakePartyItemNum("a7!iron", 2) DestroyItem("a7!iron") DestroyItem("a7!iron")
            TakePartyItemNum("scrl2e", 1) DestroyItem("scrl2e")
            StartCutSceneMode() StartCutScene("a7!ct03")~ EXIT
END

IF ~~ Golem.Type.Iron.Greater
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 4) SetGlobal("GolemVariant", "LOCALS", 3)
            TakePartyItemNum("a7!iron", 4) DestroyItem("a7!iron") DestroyItem("a7!iron") DestroyItem("a7!iron") DestroyItem("a7!iron")
            TakePartyItemNum("scrl2e", 1) DestroyItem("scrl2e")
            StartCutSceneMode() StartCutScene("a7!ct04")~ EXIT
END

IF ~~ Golem.Type.Iron.Perfect
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 4) SetGlobal("GolemVariant", "LOCALS", 4)
            TakePartyItemNum("a7!iron", 4) DestroyItem("a7!iron") DestroyItem("a7!iron") DestroyItem("a7!iron") DestroyItem("a7!iron")
            TakePartyItemNum("scrl2e", 1) DestroyItem("scrl2e")
            TakePartyItemNum("a7!glir", 1) DestroyItem("a7!glir")
            StartCutSceneMode() StartCutScene("a7!ct04")~ EXIT
END


IF ~~ Golem.Type.Mithral.Lesser
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 5) SetGlobal("GolemVariant", "LOCALS", 1)
            TakePartyItemNum("a7!mith", 1) DestroyItem("a7!mith")
            StartCutSceneMode() StartCutScene("a7!ct02")~ EXIT
END

IF ~~ Golem.Type.Mithral.Regular
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 5) SetGlobal("GolemVariant", "LOCALS", 2)
            TakePartyItemNum("a7!mith", 2) DestroyItem("a7!mith") DestroyItem("a7!mith")
            StartCutSceneMode() StartCutScene("a7!ct03")~ EXIT
END

IF ~~ Golem.Type.Mithral.Greater
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 5) SetGlobal("GolemVariant", "LOCALS", 3)
            TakePartyItemNum("a7!mith", 4) DestroyItem("a7!mith") DestroyItem("a7!mith") DestroyItem("a7!mith") DestroyItem("a7!mith")
            StartCutSceneMode() StartCutScene("a7!ct04")~ EXIT
END

IF ~~ Golem.Type.Mithral.Perfect
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 5) SetGlobal("GolemVariant", "LOCALS", 4)
            TakePartyItemNum("a7!mith", 4) DestroyItem("a7!mith") DestroyItem("a7!mith") DestroyItem("a7!mith") DestroyItem("a7!mith")
            TakePartyItemNum("a7!glmi", 1) DestroyItem("a7!glmi")
            StartCutSceneMode() StartCutScene("a7!ct04")~ EXIT
END


IF ~~ Golem.Type.Bone
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 8) SetGlobal("GolemVariant", "LOCALS", 9)
            TakePartyItemNum("a7!bone", 4) DestroyItem("a7!bone") DestroyItem("a7!bone") DestroyItem("a7!bone") DestroyItem("a7!bone")
            TakePartyItemNum("scrl2d", 1) DestroyItem("scrl2d")
            StartCutSceneMode() StartCutScene("a7!ct02")~ EXIT
END

IF ~~ Golem.Type.Ice
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 10) SetGlobal("GolemVariant", "LOCALS", 9)
            TakePartyItemNum("a7!ice", 1) DestroyItem("a7!ice")
            TakePartyItemNum("scrl2f", 1) DestroyItem("scrl2f")
            TakePartyItemNum("scrl6i", 1) DestroyItem("scrl6i")
            StartCutSceneMode() StartCutScene("a7!ct03")~ EXIT
END

IF ~~ Golem.Type.Lightning
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 12) SetGlobal("GolemVariant", "LOCALS", 9)
            TakePartyGold(100000)
            TakePartyItemNum("scclite", 1) DestroyItem("scclite")
            StartCutSceneMode() StartCutScene("a7!ct03")~ EXIT
END

IF ~~ Golem.Type.Ruby
  SAY @41043 /* You start with the construction of the golem body... */
  IF ~~ DO ~SetGlobal("stage", "LOCALS", 2) SetGlobal("GolemType", "LOCALS", 13) SetGlobal("GolemVariant", "LOCALS", 9)
            TakePartyItemNum("a7!ruby", 4) DestroyItem("a7!ruby")
            TakePartyItemNum("misc16", 2) DestroyItem("misc16")
            TakePartyItemNum("scrl8g", 1) DestroyItem("scrl8g")
            StartCutSceneMode() StartCutScene("a7!ct03")~ EXIT
END
