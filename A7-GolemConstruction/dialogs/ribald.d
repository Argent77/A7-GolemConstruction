// *** Ribald Barterman of the Adventurer's Mart ***

APPEND ~ribald~
  IF ~~ ribald.1
    SAY @45601 /* I'm afraid you're a bit late. I sold my last piece just a few weeks ago. That kind of equipment is hard to come by as there isn't much demand for it. */
    ++ #45525 /* I see. I'll be on my way. */ + 46
  END
END

EXTEND_BOTTOM ~ribald~ 0
  + ~Global("A7!GolemAbility", "GLOBAL", 1) Global("A7!GolemNoteCI", "GLOBAL", 0) PartyHasItem("a7!note2")~
    + @45600 /* I've heard that you're dealing with equipment for golem construction. Do you have any for sale? */
      DO ~SetGlobal("A7!GolemNoteCI", "GLOBAL", 1)~ + ribald.1
END
