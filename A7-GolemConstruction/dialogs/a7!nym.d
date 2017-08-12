// *** ToB: Drow Merchant Nym ***

BEGIN ~A7!NYM~

IF ~NumTimesTalkedTo(0) !Race(Player1, ELF)~ nym.intro.1
  SAY @44000 /* Vendui - you have my warmest greetings, honored customer.  I am Nym, a merchant. */
  IF ~~ DO ~SetGlobalTimer("A7!NymTimer", "GLOBAL", FIVE_DAYS)~ + nym.intro.3
END

IF ~NumTimesTalkedTo(0) Race(Player1, ELF)~ nym.intro.2
  SAY @44001 /* Vendui - you have my greetings, darthiir.  I am Nym, a merchant. */
  IF ~~ DO ~SetGlobalTimer("A7!NymTimer", "GLOBAL", FIVE_DAYS)~ + nym.intro.3
END

IF ~~ nym.intro.3
  SAY @44005 /* Can I interest you in some of my wares? */
  ++ @44006 /* What do you have to offer? */ + nym.intro.4
  ++ @44007 /* Die, drow scum! */ DO ~Enemy()~ EXIT
END

IF ~~ nym.intro.4
  SAY @44008 /* I have a great variety of high quality goods for the successful adventurer in stock. For a bit of extra coin I can also show you some of my exotic wares. */
  = @44009 /* Sadly, your victory over the inhabitants of this settlement have bereft me of a good source for replenishing my stock. But I will try to find other sources to cater the needs of well-paying customers such as you. */
  IF ~~ DO ~AddJournalEntry(@49006, QUEST)~ + nym.talk.3
END

IF ~!NumTimesTalkedTo(0) !Race(Player1, ELF)~ nym.talk.1
  SAY @44003 /* You have my warmest greetings again, honored customer. */
  IF ~!GlobalTimerExpired("A7!NymTimer", "GLOBAL")~ + nym.talk.3
  IF ~GlobalTimerExpired("A7!NymTimer", "GLOBAL") GlobalLT("A7!NymPriceAdvance", "GLOBAL", 2)~ + nym.talk.4
  IF ~GlobalTimerExpired("A7!NymTimer", "GLOBAL") GlobalGT("A7!NymPriceAdvance", "GLOBAL", 1) GlobalLT("A7!NymPriceAdvance", "GLOBAL", 6)~ + nym.talk.5
  IF ~GlobalTimerExpired("A7!NymTimer", "GLOBAL") GlobalGT("A7!NymPriceAdvance", "GLOBAL", 5)~ + nym.talk.6
END

IF ~!NumTimesTalkedTo(0) Race(Player1, ELF)~ nym.talk.2
  SAY @44004 /* My greetings again, darthiir. */
  IF ~!GlobalTimerExpired("A7!NymTimer", "GLOBAL")~ + nym.talk.3
  IF ~GlobalTimerExpired("A7!NymTimer", "GLOBAL") GlobalLT("A7!NymPriceAdvance", "GLOBAL", 2)~ + nym.talk.4
  IF ~GlobalTimerExpired("A7!NymTimer", "GLOBAL") GlobalGT("A7!NymPriceAdvance", "GLOBAL", 1) GlobalLT("A7!NymPriceAdvance", "GLOBAL", 6)~ + nym.talk.5
  IF ~GlobalTimerExpired("A7!NymTimer", "GLOBAL") GlobalGT("A7!NymPriceAdvance", "GLOBAL", 5)~ + nym.talk.6
END

IF ~~ nym.talk.3
  SAY @44005 /* Can I interest you in some of my wares? */
  ++ @44010 /* Yes, show me your wares. */ DO ~StartStore("a7!nym1", LastTalkedToBy)~ EXIT
  + ~PartyGoldGT(99)~ + @44011 /* I'd like to browse your exotic wares. */ DO ~TakePartyGold(100)~ + nym.store.exotic
  ++ @44012 /* I'm not interested at the moment. Farewell, Nym. */ + nym.talk.bye
END

IF ~~ nym.talk.4
  SAY @44013 /* Your arrival is accompanied by good news. I was able to restock some of my wares. Unfortunately, the effort to find an agreeable source in these parts of the lands is extraordinarily high. I have no choice but to pass some of my expenses on to you, honored customer. */
  IF ~~ DO ~SetGlobalTimer("A7!NymTimer", "GLOBAL", FIVE_DAYS) IncrementGlobal("A7!NymPriceAdvance", "GLOBAL", 1)~ + nym.talk.3
END

IF ~~ nym.talk.5
  SAY @44014 /* I was able to restock some of my wares. Unfortunately, I have no choice but to raise my prices again, honored customer. */
  IF ~~ DO ~SetGlobalTimer("A7!NymTimer", "GLOBAL", FIVE_DAYS) IncrementGlobal("A7!NymPriceAdvance", "GLOBAL", 1)~ + nym.talk.3
END

IF ~~ nym.talk.6
  SAY @44015 /* I was able to restock some of my wares again. But do not fear, honored customer. I can offer you my wares without another advance in price. */
  IF ~~ DO ~SetGlobalTimer("A7!NymTimer", "GLOBAL", FIVE_DAYS)~ + nym.talk.3
END

IF ~~ nym.store.exotic
  SAY @44016 /* Please, be my guest. You will not be disappointed. */
  IF ~~ DO ~StartStore("a7!nym2", LastTalkedToBy)~ EXIT
END


IF ~~ nym.talk.bye
  SAY @44002 /* I shall remain here a bit longer, so feel free to return and browse my wares at any time.  Aluve. */
  IF ~~ EXIT
END
