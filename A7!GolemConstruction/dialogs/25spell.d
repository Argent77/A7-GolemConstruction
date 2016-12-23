// *** ToB: Lazarus Librarus ***

EXTEND_TOP ~25spell~ 1
  + ~Global("A7!GolemAbility", "GLOBAL", 1) Global("A7!PocketEquipmentSold", "GLOBAL", 0)~ + @42500 /* Do you have any equipment for sale that can be used for constructing golems? */ + purchase.1
END

APPEND ~25spell~
  IF ~~ purchase.1
    SAY @42501 /* Hmm... Something like this is usually very hard to come by as there is not much demand for it. */
    = @42502 /* But you are in luck. In my youth I have dabbled in the art of golem building myself, even though it didn't result into anything practical. I am more of a scholar after all. */
    = @42503 /* The equipment is still in my possession, however. I could part with it for the right price. Are 10,000 gold agreeable? */
    + ~OR(2) !Global("lazarusscroll", "GLOBAL", 3) CheckStatLT(LastTalkedToBy, 14, CHR)~ + @42504 /* That's pretty expensive. Can't you lower the price a bit? */ + purchase.2
    + ~Global("lazarusscroll", "GLOBAL", 3) CheckStatGT(LastTalkedToBy, 13, CHR) !Global("YagaShuraHeart", "GLOBAL", 4)~ + @42504 /* That's pretty expensive. Can't you lower the price a bit? */ + purchase.3a
    + ~Global("lazarusscroll", "GLOBAL", 3) CheckStatGT(LastTalkedToBy, 13, CHR) Global("YagaShuraHeart", "GLOBAL", 4)~ + @42504 /* That's pretty expensive. Can't you lower the price a bit? */ + purchase.3b
    + ~PartyGoldGT(9999)~ + @42505 /* Yes, they are. Here is your gold. */ + purchase.5
    + ~PartyGoldLT(10000)~ + @42506 /* I can't afford it right now. */ + purchase.4
    ++ @42507 /* I'm not interested. */ + purchase.4
  END

  IF ~~ purchase.2
    SAY @42508 /* No, I'm afraid not. It took me years and a lot of effort to acquire all the needed parts. I can't possibly sell it for less. */
    + ~PartyGoldGT(9999)~ + @42509 /* Alright. Here are your 10,000 gold. */ + purchase.5
    + ~PartyGoldLT(10000)~ + @42506 /* I can't afford it right now. */ + purchase.4
    ++ @42507 /* I'm not interested. */ + purchase.4
  END

  IF ~~ purchase.3a
    SAY @42510 /* I can probably make an exception since you helped me to acquire my spellbook. How about 6,000 gold? You won't find a better bargain. */
    + ~PartyGoldGT(5999)~ + @42511 /* Alright. Here are your 6,000 gold. */ + purchase.6
    + ~PartyGoldLT(6000)~ + @42506 /* I can't afford it right now. */ + purchase.4
    ++ @42507 /* I'm not interested. */ + purchase.4
  END

  IF ~~ purchase.3b
    SAY @42514 /* I can probably make an exception since you helped me to acquire my spellbook back in Saradush. How about 6,000 gold? You won't find a better bargain. */
    + ~PartyGoldGT(5999)~ + @42511 /* Alright. Here are your 6,000 gold. */ + purchase.6
    + ~PartyGoldLT(6000)~ + @42506 /* I can't afford it right now. */ + purchase.4
    ++ @42507 /* I'm not interested. */ + purchase.4
  END

  IF ~~ purchase.4
    SAY @42512 /* Perhaps another time. */
    IF ~~ + 1
  END

  IF ~~ purchase.5
    SAY @42513 /* Thank you. You won't be disappointed. The tools are still in excellent condition. */
    IF ~~ DO ~SetGlobal("A7!PocketEquipmentSold", "GLOBAL", 1)
              TakePartyGold(10000)
              GiveItemCreate("a7!eqm1", LastTalkedToBy, 1, 0, 0)
              GiveItemCreate("a7!eqm2", LastTalkedToBy, 1, 0, 0)
              GiveItemCreate("a7!eqm3", LastTalkedToBy, 1, 0, 0)
              GiveItemCreate("a7!eqm4", LastTalkedToBy, 1, 0, 0)
              AddJournalEntry(@49005, QUEST)~ EXIT  
  END

  IF ~~ purchase.6
    SAY @42513 /* Thank you. You won't be disappointed. The tools are still in excellent condition. */
    IF ~~ DO ~SetGlobal("A7!PocketEquipmentSold", "GLOBAL", 1)
              TakePartyGold(6000)
              GiveItemCreate("a7!eqm1", LastTalkedToBy, 1, 0, 0)
              GiveItemCreate("a7!eqm2", LastTalkedToBy, 1, 0, 0)
              GiveItemCreate("a7!eqm3", LastTalkedToBy, 1, 0, 0)
              GiveItemCreate("a7!eqm4", LastTalkedToBy, 1, 0, 0)
              AddJournalEntry(@49005, QUEST)~ EXIT  
  END
END
