// *** SoA: Jerlia the Ore Merchant ***

ADD_STATE_TRIGGER ~scjerlia~ 0 ~Global("A7!GolemAbility", "GLOBAL", 0)~

APPEND ~scjerlia~

  IF WEIGHT #4 ~Global("A7!GolemAbility", "GLOBAL", 1) Global("A7!Intro", "LOCALS", 0)~ jerlia.intro.1
    SAY #28740 /* You interested in a bulk purchase of ore? I've got fine prices for masonry as well, and crafters that can build you everything from arches to overhangs. */
    ++ @44500 /* I'm looking for certain materials to construct golem from. */ DO ~SetGlobal("A7!Intro", "LOCALS", 1)~ + jerlia.1
    ++ #28743 /* Nothing, sorry I bothered you. */ + jerlia.bye.1
  END

  IF WEIGHT #4 ~Global("A7!GolemAbility", "GLOBAL", 1) !Global("A7!Intro", "LOCALS", 0)~ jerlia.intro.2
    SAY @44501 /* Ah, the golem maker returns. Do you need another chunk of ore? */
    + ~!Global("A7!UpdateStore", "LOCALS", 1)~ + @44502 /* Yes, I'd like to browse your store again. */ + jerlia.store.2
    + ~Global("A7!UpdateStore", "LOCALS", 1)~ + @44502 /* Yes, I'd like to browse your store again. */ DO ~SetGlobal("A7!UpdateStore", "LOCALS", 2)~ + jerlia.store.3
    ++ @44503 /* Not at the moment. Maybe later. */ + jerlia.bye.1
  END
  
  IF ~~ jerlia.1
    SAY @44504 /* You kiddin' me, right? Well, I usually sell in bulk, but I might do an exception in your case. What you lookin' for? */
    + ~!Global("A7!UpdateStore", "LOCALS", 1)~ + @44505 /* I'm interested in clay or stone. */ + jerlia.store.1
    + ~Global("A7!UpdateStore", "LOCALS", 1)~ + @44505 /* I'm interested in clay or stone. */ DO ~SetGlobal("A7!UpdateStore", "LOCALS", 2)~ + jerlia.store.1
    + ~!Global("A7!UpdateStore", "LOCALS", 1) OR(3) Global("A7!TomeGolemIron", "GLOBAL", 1) Global("A7!TomeGolemMithral", "GLOBAL", 1) Global("A7!TomeGolemIce", "GLOBAL", 1)~ 
        + @44506 /* Do you have something special on sale? Maybe iron, or even mithral? */ + jerlia.store.1
    + ~Global("A7!UpdateStore", "LOCALS", 1) OR(3) Global("A7!TomeGolemIron", "GLOBAL", 1) Global("A7!TomeGolemMithral", "GLOBAL", 1) Global("A7!TomeGolemIce", "GLOBAL", 1)~ 
        + @44506 /* Do you have something special on sale? Maybe iron, or even mithral? */ DO ~SetGlobal("A7!UpdateStore", "LOCALS", 2)~ + jerlia.store.1
  END

  IF ~~ jerlia.store.1
    SAY @44507 /* I can offer you a great variety of ore and masonry. For the right price you can also purchase some of the more exotic materials. Feel free to browse, and don't be shy to pick what you need. */
    IF ~NumTimesTalkedTo(1)~ DO ~SetNumTimesTalkedTo(0) StartStore("a7!jerl", LastTalkedToBy)~ EXIT
    IF ~NumTimesTalkedToGT(1)~ DO ~StartStore("a7!jerl", LastTalkedToBy)~ EXIT
  END

  IF ~~ jerlia.store.2
    SAY @44508 /* Always a pleasure. */
    IF ~NumTimesTalkedTo(1)~ DO ~SetNumTimesTalkedTo(0) StartStore("a7!jerl", LastTalkedToBy)~ EXIT
    IF ~NumTimesTalkedToGT(1)~ DO ~StartStore("a7!jerl", LastTalkedToBy)~ EXIT
  END

  IF ~~ jerlia.store.3
    SAY @44509 /* Your timing is perfect. I stocked up my store right now with new and exotic items from a rather particular source. */
    IF ~NumTimesTalkedTo(1)~ DO ~SetNumTimesTalkedTo(0) StartStore("a7!jerl", LastTalkedToBy)~ EXIT
    IF ~NumTimesTalkedToGT(1)~ DO ~StartStore("a7!jerl", LastTalkedToBy)~ EXIT
  END
  
  IF ~~ jerlia.bye.1
    SAY #28746 /* S'all right friend. Come back when you need. */
    IF ~NumTimesTalkedTo(1)~ DO ~SetNumTimesTalkedTo(0)~ EXIT
    IF ~NumTimesTalkedToGT(1)~ EXIT
  END
END
