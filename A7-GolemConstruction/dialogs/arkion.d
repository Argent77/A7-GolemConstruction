// *** BG1EE: The necromancer Arkion ***

// Golem can be commissioned
ADD_STATE_TRIGGER ~arkion~ 6 ~!Global("HelpArkion", "GLOBAL", 0) Global("A7!GolemBuildState", "LOCALS", 0) !GlobalTimerNotExpired("A7!GolemBuildTimer", "LOCALS")~
ADD_TRANS_TRIGGER ~arkion~ 6 ~False()~
EXTEND_BOTTOM ~arkion~ 6 
  + ~PartyHasItemIdentified("a7!tomdg") Global("A7!GolemBuildIntro", "LOCALS", 0)~ + @46000 /* I came across a curious tome that deals with the construction of some weird kind of golems. It sounds rather grisly, so I thought you might be interested. */ DO ~SetGlobal("A7!GolemCommission","GLOBAL",1) SetGlobal("A7!GolemBuild", "MYAREA", 1) SetGlobal("A7!GolemBuildIntro", "LOCALS", 1) TakePartyItemNum("a7!tomdg", 1) AddexperienceParty(2000)~ + arkion.order.intro.1
  + ~!Global("A7!GolemBuildIntro", "LOCALS", 0)~ + @46001 /* I'd like to commission the construction of a doll golem. Are you up to the task? */ + arkion.order.1
  + ~Global("A7!GolemRepairIntro","LOCALS",0) Global("A7!DollGolemCreated","LOCALS",1)~ + @46019 /* I'd like to have my doll golem repaired. Can you do it? */ DO ~SetGlobal("A7!GolemRepairIntro","LOCALS",1)~ + arkion.repair.intro.1
  + ~!Global("A7!GolemRepairIntro","LOCALS",0) Global("A7!DollGolemCreated","LOCALS",1)~ + @46020 /* I'd like to purchase another "Repair Golem" scroll. */ + arkion.repair.1
  + ~Kit(LastTalkedToBy, MAGESCHOOL_NECROMANCER)~ + @46002 /* Certainly, cousin. Goodbye. */ EXIT
  + ~!Kit(LastTalkedToBy, MAGESCHOOL_NECROMANCER)~ + @46003 /* I don't think so. Goodbye. */ EXIT
END

APPEND ~arkion~

// Golem construction is still in process
IF ~!Global("HelpArkion", "GLOBAL", 0) GlobalTimerNotExpired("A7!GolemBuildTimer", "LOCALS")~ arkion.working
  SAY @46004 /* Come back later. Work like this takes time. */
  IF ~~ EXIT
END

// Golem is ready and can be picked up
IF ~!Global("HelpArkion", "GLOBAL", 0) Global("A7!GolemBuildState", "LOCALS", 1) GlobalTimerExpired("A7!GolemBuildTimer", "LOCALS")~ arkion.finished
  SAY @46005 /* Ah, you return. Look at this beauty. It's a true masterpiece, and it's yours. Just take it out of sight before I change my mind. */
  IF ~~ DO ~SetGlobal("A7!DollGolemCreated","LOCALS",1) SetGlobal("A7!GolemBuildState","LOCALS",0) ForceSpellRES("a7!smdg",Myself)~ EXIT
END

IF ~~ arkion.order.intro.1
  SAY @46006 /* Let me see! Hmm, yes... interesting read. Good thing you brought it to me. I can't wait to try it out. */
  ++ @46007 /*Does that mean you can build golems for me? */ DO ~AddJournalEntry(@49009, QUEST)~ + arkion.order.intro.2
END

IF ~~ arkion.order.intro.2
  SAY @46008 /* Not so fast, my dark cousin. First I need the right materials. And I'd like to be paid for my service. */
  = @46009 /* I require a fresh corpse and a cursed Antidote potion for the golem body. My fee is 2000 gold. Still interested? */
  + ~PartyGoldGT(1999) PartyHasItem("potn32") OR(4) PartyHasItem("misc54") PartyHasItem("misc79") PartyHasItem("misc80") PartyHasItem("a7!body")~ + @46010 /* Yes, I'm interested. */ + arkion.order.accepted.1
  + ~PartyGoldLT(2000)~ + @46011 /* I don't have enough money right now. Perhaps later. */ EXIT
  + ~PartyGoldGT(1999) PartyHasItem("potn32") !PartyHasItem("misc54") !PartyHasItem("misc79") !PartyHasItem("misc80") !PartyHasItem("a7!body") ~ + @46012 /* I don't have a fresh corpse. Perhaps later. */ EXIT
  + ~PartyGoldGT(1999) !PartyHasItem("potn32")~ + @46013 /* I don't have a cursed Antidote potion. Perhaps later. */ EXIT
  ++ @46014 /* I'm not interested. Goodbye. */ EXIT
END

IF ~~ arkion.order.1
  SAY @46015 /* Certainly. Do you have a fresh corpse, a cursed Antidote and the 2000 gold? */
  + ~PartyGoldGT(1999) PartyHasItem("potn32") OR(4) PartyHasItem("misc54") PartyHasItem("misc79") PartyHasItem("misc80") PartyHasItem("a7!body")~ + @46016 /* Yes, here they are. */ + arkion.order.accepted.1
  + ~PartyGoldLT(2000)~ + @46011 /* I don't have enough money right now. Perhaps later. */ EXIT
  + ~PartyGoldGT(1999) PartyHasItem("potn32") !PartyHasItem("misc54") !PartyHasItem("misc79") !PartyHasItem("misc80") !PartyHasItem("a7!body") ~ + @46012 /* I don't have a fresh corpse. Perhaps later. */ EXIT
  + ~PartyGoldGT(1999) !PartyHasItem("potn32")~ + @46013 /* I don't have a cursed Antidote potion. Perhaps later. */ EXIT
  ++ @46014 /* I'm not interested. Goodbye. */ EXIT
END

IF ~~ arkion.order.accepted.1
  SAY @46017 /* Ah, that one looks juicy. Put everything over there on the table. */
  IF ~PartyHasItem("misc54")~ DO ~TakePartyItemNum("misc54", 1) TakePartyItemNum("potn32", 1) TakePartyGold(2000)~ + arkion.order.accepted.2
  IF ~PartyHasItem("misc79")~ DO ~TakePartyItemNum("misc79", 1) TakePartyItemNum("potn32", 1) TakePartyGold(2000)~ + arkion.order.accepted.2
  IF ~PartyHasItem("misc80")~ DO ~TakePartyItemNum("misc80", 1) TakePartyItemNum("potn32", 1) TakePartyGold(2000)~ + arkion.order.accepted.2
  IF ~PartyHasItem("a7!body")~ DO ~TakePartyItemNum("a7!body", 1) TakePartyItemNum("potn32", 1) TakePartyGold(2000)~ + arkion.order.accepted.2
END

IF ~~ arkion.order.accepted.2
  SAY @46018 /* I reckon that construction will take about a day. Come back tomorrow. */
  IF ~~ DO ~SetGlobal("A7!GolemBuildState", "LOCALS", 1) SetGlobalTimer("A7!GolemBuildTimer", "LOCALS", ONE_DAY)~ EXIT
END

IF ~~ arkion.repair.intro.1
  SAY @46021 /* I have better things to do than repair your broken golems. */
  = @46022 /* But that doesn't mean I can't help you. I have devised a spell recently that allows me to keep my own servant in a working state. I could sell you a copy for 250 gold. What do you say? */
  + ~PartyGoldLT(250)~ + @46011 /* I don't have enough money right now. Perhaps later. */ EXIT
  + ~PartyGoldGT(249) !Global("A7!GolemRepairIntro","LOCALS",2)~ + @46024 /* Here you go. */ + arkion.repair.intro.accepted.1
  + ~PartyGoldGT(249) Global("A7!GolemRepairIntro","LOCALS",2)~ + @46024 /* Here you go. */ + arkion.repair.accepted.1
  ++ @46014 /* I'm not interested. Goodbye. */ EXIT
END

IF ~~ arkion.repair.1
  SAY @46023 /* Certainly. Just pay me the 250 gold and the scroll is yours. */
  + ~PartyGoldLT(250)~ + @46011 /* I don't have enough money right now. Perhaps later. */ EXIT
  + ~PartyGoldGT(249) !Global("A7!GolemRepairIntro","LOCALS",2)~ + @46024 /* Here you go. */ + arkion.repair.intro.accepted.1
  + ~PartyGoldGT(249) Global("A7!GolemRepairIntro","LOCALS",2)~ + @46024 /* Here you go. */ + arkion.repair.accepted.1
  ++ @46014 /* I'm not interested. Goodbye. */ EXIT
END

IF ~~ arkion.repair.intro.accepted.1
  SAY @46025 /* Very good. This is the scroll. Just read it aloud in front of your golem to activate the enchantment. You can read, can't you? */
  IF ~~ DO ~SetGlobal("A7!GolemRepairIntro","LOCALS",2) SetGlobal("A7!GolemRepairActive","LOCALS",1) TakePartyGold(250) GiveItemCreate("a7!scgr1",LastTalkedToBy,1,0,0)~ EXIT
END

IF ~~ arkion.repair.accepted.1
  SAY @46026 /* Very good. This is the scroll. Now go. */
  IF ~~ DO ~SetGlobal("A7!GolemRepairActive","LOCALS",1) TakePartyGold(250) GiveItemCreate("a7!scgr1",LastTalkedToBy,1,0,0)~ EXIT
END

END
