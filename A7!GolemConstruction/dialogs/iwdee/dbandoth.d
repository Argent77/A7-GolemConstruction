// *** IWDEE: Bandoth of Lower Dorn's Deep ***

// Ask for permission to build golem in this place
EXTEND_TOP ~dbandoth~ 9
  + ~Global("A7!GolemAbility", "GLOBAL", 1) Global("A7!DornsDeepWorkshop", "GLOBAL", 0)~ + @122000 /* Your workshop is well equipped. Do you mind if we build golems in this place? */ + bandoth.2
END

// Adding option to build golems in this place before Bandoth leaves forever
ADD_TRANS_TRIGGER ~dbandoth~ 26 ~OR(2) !Global("A7!GolemAbility", "GLOBAL", 1) !Global("A7!DornsDeepWorkshop", "GLOBAL", 0)~

EXTEND_TOP ~dbandoth~ 26
  IF ~Global("A7!GolemAbility", "GLOBAL", 1) Global("A7!DornsDeepWorkshop", "GLOBAL", 0)~ 
    DO ~SetGlobal("A7!DornsDeepWorkshop", "GLOBAL", 1) AddJournalEntry(@140004, QUEST) ContainerEnable("A7!Furnace1", TRUE)~ + bandoth.1
END

APPEND ~dbandoth~
  IF ~~ bandoth.1
    SAY @122001 /* Do whatever you want with this place. */
    COPY_TRANS ~dbandoth~ 26
  END

  IF ~~ bandoth.2
    SAY @122002 /* Are you out of your mind? You have tested my patience far too long already. Why should I allow your presence any longer? */
    + ~CheckStatLT(LastTalkedToBy, 15, CHR) PartyGoldGT(3999)~ + @122003 /* Would a monetary compensation change your mind? */ + bandoth.3
    + ~CheckStatGT(LastTalkedToBy, 14, CHR) PartyGoldGT(1999)~ + @122003 /* Would a monetary compensation change your mind? */ + bandoth.3
    + ~Class(LastTalkedToBy, THIEF_ALL)~ + @122004 /* How about this? Allow me to use this workshop or you will have a knife in your back before this conversation is over. */ + bandoth.4
    + ~!Class(LastTalkedToBy, THIEF_ALL) Class(LastTalkedToBy, MAGE_ALL)~ + @122005 /* How about this? Allow me to use this workshop or this fireball will blast you to oblivion right now. */ + bandoth.4
    + ~!Class(LastTalkedToBy, PALADIN_ALL) !Class(LastTalkedToBy, THIEF_ALL) !Class(LastTalkedToBy, MAGE_ALL)~ + @122006 /* How about this? Allow me to use this workshop or I will chop your head off without hesitation. */ + bandoth.4
    ++ @122007 /* I can't think of a good reason right now. */ + bandoth.5
  END

  IF ~~ bandoth.3
    SAY @122008 /* Hah! No amount of money could change my mind about you. But that doesn't mean I cannot try to tolerate your presence a bit longer. */
    IF ~CheckStatLT(LastTalkedToBy, 15, CHR)~ + bandoth.3.1
    IF ~CheckStatGT(LastTalkedToBy, 14, CHR)~ + bandoth.3.2
  END

  IF ~~ bandoth.3.1
    SAY @122009 /* Give me 4000 gold and you can build as many golems as you want. Just don't bother me with any petty conversations. Agreed? */
    ++ @122010 /* It's a deal. */ DO ~TakePartyGold(4000)~ + bandoth.3.3
    ++ @122011 /* I refuse. That's too expensive for me. */ + bandoth.5
  END

  IF ~~ bandoth.3.2
    SAY @122012 /* Give me 2000 gold and you can build as many golems as you want. Do you accept? */
    ++ @122010 /* It's a deal. */ DO ~TakePartyGold(2000)~ + bandoth.3.3
    ++ @122011 /* I refuse. That's too expensive for me. */ + bandoth.5
  END

  IF ~~ bandoth.3.3
    SAY @122013 /* Well, I guess that will do. Be on your way now. I have wasted enough time on you already. */
    IF ~~ DO ~SetGlobal("A7!DornsDeepWorkshop", "GLOBAL", 1) AddJournalEntry(@140002, QUEST) ContainerEnable("A7!Furnace1", TRUE)~ EXIT
  END

  IF ~~ bandoth.4
    SAY @122014 /* You dare to threaten me in my own home? I should kick you out right now for this insolence. */
    = @122015 /* But since I don't want to lose my life over such trivial matters I will make an exception and comply with your wishes. Do what you have to do, but don't expect any more charity from me. */
    IF ~~ DO ~SetGlobal("A7!DornsDeepWorkshop", "GLOBAL", 1) AddJournalEntry(@140003, QUEST) ContainerEnable("A7!Furnace1", TRUE)~ EXIT
  END

  IF ~~ bandoth.5
    SAY @122016 /* Then bother me no further. */
    IF ~~ EXIT
  END
END
