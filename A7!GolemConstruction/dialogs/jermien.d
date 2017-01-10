// *** Cowled Wizard Jermien of Imnesville ***

APPEND ~jugjer01~
  IF ~~ jugjer01.1
    SAY @45502 /* Have you not seen that my foolishness almost cost me my life and that of my daughter? The best course of action would be to destroy all my notes about it. */
    ++ @45503 /* Don't you worry. I'm powerful enough to deal with every possible outcome. */ + jugjer01.2
    ++ @45504 /* I have studied the arcane arts under the tutelage of experienced mages in Candlekeep. You can trust me that I will take great care. */ + jugjer01.3
  END

  IF ~~ jugjer01.2
    SAY @45505 /* I'm not convinced that you can succeed where I have failed with that kind of attitude. I will not be responsible for another disaster. My notes must be destroyed. */
    IF ~~ + jugjer01.bye
  END

  IF ~~ jugjer01.3
    SAY @45506 /* I must admit that your words have some merit. Very well, I will entrust you with my personal tome of golem building. Study it well and don't repeat my mistakes. */
    = @45507 /* You can also make use of my equipment if you want to. I certainly won't need it for some time. */
    IF ~~ DO ~SetGlobal("A7!JermienGolem", "MYAREA", 1) SetGlobal("A7!JermienWorkshop", "GLOBAL", 1) AddJournalEntry(@49007, QUEST) GiveItem("a7!tom03", LastTalkedToBy)~ + jugjer01.bye
  END

  IF ~~ jugjer01.4
    SAY @45502 /* Have you not seen that my foolishness almost cost me my life and that of my daughter? The best course of action would be to destroy all my notes about it. */
    IF ~~ EXTERN ~imoen2j~ Imoen2.1
  END

  IF ~~ jugjer01.5
    SAY @45510 /* Hmm. I can probably make an exception since you were able to take care of my failed experiment so easily. Very well, I will entrust you with my personal tome of golem building. Study it well and don't repeat my mistakes. */
    = @45507 /* You can also make use of my equipment if you want to. I certainly won't need it for some time. */
    IF ~~ DO ~SetGlobal("A7!JermienGolem", "MYAREA", 1) SetGlobal("A7!JermienWorkshop", "GLOBAL", 1) AddJournalEntry(@49007, QUEST) GiveItem("a7!tom03", LastTalkedToBy)~ + jugjer01.bye
  END

  IF ~~ jugjer01.bye
    SAY @45508 /* I will take my leave now. Farewell. */
    COPY_TRANS ~jugjer01~ 33
  END
END

ADD_TRANS_TRIGGER ~jugjer01~ 33 ~False()~

EXTEND_BOTTOM ~jugjer01~ 33
  + ~OR(2) Class(Player1, MAGE_ALL) Class(Player1, BARD_ALL)~ + @45500 /* Before you go, can you please teach me how to build juggernaut golems? I'd like to try it out by myself. */ + jugjer01.1
  + ~!Class(Player1, MAGE_ALL) !Class(Player1, BARD_ALL) IsValidForPartyDialog("Imoen2")~ + @45509 /* Before you go, can you please teach us how to build juggernaut golems? We'd like to try it out by ourselves. */ + jugjer01.4
  ++ @45501 /* Farewell, Jermien. */ + jugjer01.bye
END


// Imoen's part
APPEND ~imoen2j~
  IF ~~ Imoen2.1
    SAY @45511 /* C'mon Mr. J! What harm can be done when we try it out ourselves? I promise to be extra careful. Pretty please! */
    IF ~~ EXTERN ~jugjer01~ jugjer01.5
  END
END
