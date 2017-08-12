// *** IWDEE: Gelarith of the Severed Hand ***

ADD_TRANS_TRIGGER ~dgelarit~ 9 ~OR(2) !Global("A7!GolemAbility", "GLOBAL", 1) !Global("A7!SeveredHandWorkshop", "GLOBAL", 0)~

EXTEND_TOP ~dgelarit~ 9
  + ~Global("A7!GolemAbility", "GLOBAL", 1) Global("A7!SeveredHandWorkshop", "GLOBAL", 0)~ + @121000 /* The Astrolab looks like very advanced technology. Can I use it to construct golems in this place? */ + gelarit.1
  + ~Global("A7!GolemAbility", "GLOBAL", 1) Global("A7!SeveredHandWorkshop", "GLOBAL", 0)~ + @121001 /* I must take my leave. Farewell. */ EXIT
END

APPEND ~dgelarit~
  IF ~~ gelarit.1
    SAY @121002 /* Golems you say? Hmm. We have built the Astrolab primarily for researching space and time. They would be of little use for the task you suggested. */
    = @121003 /* However, there are tools right over there on the table that have been used to construct and maintain the Astrolab and other machinery. You can use them to build your golems. But don't touch any of the other devices in this room. */
    ++ @121004 /* Understood. And thank you. */ DO ~SetGlobal("A7!SeveredHandWorkshop", "GLOBAL", 1) SetRestEncounterProbabilityDay(0) SetRestEncounterProbabilityNight(0) AddAreaType(CANRESTOTHER) AddJournalEntry(@140001, QUEST)~ EXIT
  END
END
