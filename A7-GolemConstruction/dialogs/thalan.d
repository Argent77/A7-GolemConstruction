// *** BG1EE: Thalantyr of the High Hedge ***

EXTEND_BOTTOM ~thalan~ 1 26
  + ~Global("A7!GolemCommission","GLOBAL",0) Global("A7!GolemCommissionHint","LOCALS",0) OR(2) PartyHasItemIdentified("a7!tomdg") PartyHasItemIdentified("a7!tombd")~
    + @47500 /* I stumbled upon a book that deals with the construction of some weird kind of golems. Can you build one for me? */
    + thalan.1
END

APPEND ~thalan~
  IF ~~ thalan.1
    SAY @47501 /* You don't ask for much, do you? Let me see what you have. */
    = @47502 /* Hmm, the book appears to be genuine. */
    ++ @47503 /* So are you able to construct a golem for me? */ + thalan.2
  END

  IF ~~ thalan.2
    SAY @47504 /* Not so fast. The construction of golems is very complex and costly. This particular type of golems also appears to leech on the life force of the builder. That is more than I'm willing to suffer. */
    = @47505 /* You might have more luck with practicing necromancers. I know of a pair of ne'er-do-wells in Baldur's Gate, Arkion and Nemphre, who brought me nothing but trouble in the past. I'm positive that you can find a way to convince them one way or another to accept the task. */
    IF ~~ DO ~SetGlobal("A7!GolemCommissionHint","LOCALS",1)~ UNSOLVED_JOURNAL @49019 EXIT
  END
END
