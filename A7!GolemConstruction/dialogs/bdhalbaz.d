// *** SoD: Halbazzer Drin - Proprietor of Sorcerous Sundries ***

EXTEND_TOP ~bdhalbaz~ 16
  + ~Global("A7!GolemAbility", "GLOBAL", 1) Global("A7!SundriesPermission", "GLOBAL", 0)~ + @42000 /* May I rent the top floor for a while to construct golems? */ + permission.1
END

APPEND ~bdhalbaz~
  IF ~~ permission.1
    SAY @42001 /* Golems, you say? That is quite a task you have set before you. */
    = @42002 /* Hmm, I could rent it to you for a small fee. How about 500 gold, and I'll see to it personally that you are not to be disturbed? */
    + ~CheckStatLT(LastTalkedToBy, 16, CHR)~ + @42003 /* That's a pretty steep fee. How about 250 gold? */ + permission.3
    + ~PartyGoldGT(249) CheckStatGT(LastTalkedToBy, 15, CHR)~ + @42003 /* That's a pretty steep fee. How about 250 gold? */ + permission.4
    + ~PartyGoldGT(499)~ + @42004 /* It's a deal! */ + permission.5
    + ~PartyGoldLT(500)~ + @42005 /* I don't have enough gold. */ + permission.2
    ++ @42006 /* I've changed my mind. I don't want to rent it now. */ + permission.2
  END

  IF ~~ permission.2
    SAY @42007 /* Alright. Let me know if you require further assistance. */
    IF ~~ EXIT
  END

  IF ~~ permission.3
    SAY @42008 /* I could lower the price to 400 gold, but that is my final offer. */
    + ~PartyGoldGT(399)~ + @42004 /* It's a deal! */ + permission.6
    + ~PartyGoldLT(400)~ + @42005 /* I don't have enough gold. */ + permission.2
  END

  IF ~~ permission.4
    SAY @42009 /* You drive a hard bargain, but I won't complain. It's been a pleasure doing business with you. */
    IF ~~ DO ~TakePartyGold(250) SetGlobal("A7!SundriesPermission", "GLOBAL", 1) AddJournalEntry(@49001, QUEST)~ EXIT
  END

  IF ~~ permission.5
    SAY @42010 /* Alright. It's been a pleasure doing business with you. */
    IF ~~ DO ~TakePartyGold(500) SetGlobal("A7!SundriesPermission", "GLOBAL", 1) AddJournalEntry(@49001, QUEST)~ EXIT
  END

  IF ~~ permission.6
    SAY @42010 /* Alright. It's been a pleasure doing business with you. */
    IF ~~ DO ~TakePartyGold(400) SetGlobal("A7!SundriesPermission", "GLOBAL", 1) AddJournalEntry(@49001, QUEST)~ EXIT 
  END
END
