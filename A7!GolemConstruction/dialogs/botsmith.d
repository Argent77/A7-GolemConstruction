// *** Cespenar - Restores golem manual ***

EXTEND_BOTTOM ~botsmith~ 4
  IF ~OR(2) PartyHasItem("a7!tfrg1") PartyHasItem("a7!tfrg2")~ + bothsmith.tome06
END

APPEND ~botsmith~
  IF ~~ bothsmith.tome06
    SAY @43500 /* Huh? What gots we here? Dirty magazine? Oh... just tome of golem building. */
    IF ~OR(2) !PartyHasItem("a7!tfrg1") !PartyHasItem("a7!tfrg2")~ + bothsmith.tome06.need
    IF ~PartyHasItem("a7!tfrg1") PartyHasItem("a7!tfrg2")~ + bothsmith.tome06.want
  END

  IF ~~ bothsmith.tome06.need
    SAY @43501 /* You needs all pages for bookbinding job, however. Come back later when you found second part. */
    COPY_TRANS ~botsmith~ 4
  END

  IF ~~ bothsmith.tome06.want
    SAY @43502 /* Yous got all pages, so I will make book whole again. But I needs 5,000 gold for bookbinding job. You wants? */
    + ~PartyGoldLT(5000)~ + #66908 /* I don't have that much gold. */ + 10
    + ~PartyGoldGT(4999)~ + #66909 /* Sure, go ahead. */
        DO ~SetGlobal("A7!RestoreTome", "GLOBAL", 1)
            TakePartyGold(5000)
            TakePartyItemNum("a7!tfrg1", 1)
            DestroyItem("a7!tfrg1")
            TakePartyItemNum("a7!tfrg2", 1)
            DestroyItem("a7!tfrg2")
            DestroyGold(5000)~ + 11
    ++ #66910 /* No. What else? */ + bothsmith.tome06.stall
  END

  IF ~~ bothsmith.tome06.stall
    SAY @43503 /* OK, Cespenar keeps looking. */
    COPY_TRANS ~botsmith~ 4
  END
END
