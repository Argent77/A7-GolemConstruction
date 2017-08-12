// *** BG1EE: The necromancer Nemphre ***

// Golem can be commissioned
ADD_STATE_TRIGGER ~nemphr~ 0 ~GlobalGT("HelpNemphre", "GLOBAL", 1) !PartyHasItemIdentified("a7!tombd") Global("A7!GolemBuildIntro", "LOCALS", 0)~

APPEND ~nemphr~

// Reaction to doll golem attack on Nemphre
IF WEIGHT #-2 ~Global("A7!DollSighted", "LOCALS", 2)~ nemphr.working
  SAY @46500 /* Does poor Arkion think he can defeat me with half-hearted attempts like this? He will never be my equal as long as I live. */
  = @46501 /* And you are a fool indeed to trust his work so easily. */
  IF ~~ DO ~SetGlobal("A7!DollSighted", "LOCALS", 3)~ EXIT
END

// Ignore familiars and followers (prevents an exploit when receiving bone doll)
IF WEIGHT #-1 ~!Allegiance(LastTalkedToBy, PC)~ nemphr.ignore
  SAY @46502 /* Hmpf. I don't deal with underlings. Begone. */
  IF ~~ EXIT
END

// Golem construction is still in process
IF ~GlobalGT("HelpNemphre", "GLOBAL", 1) GlobalTimerNotExpired("A7!GolemBuildTimer", "LOCALS")~ nemphr.working
  SAY @46503 /* I told you to come back later. Now leave me to my work! */
  IF ~~ EXIT
END

// Golem is ready and can be picked up
IF ~GlobalGT("HelpNemphre", "GLOBAL", 1) Global("A7!GolemBuildState", "LOCALS", 1) GlobalTimerExpired("A7!GolemBuildTimer", "LOCALS") Global("A7!GolemLifeForce", "LOCALS", 0)~ nemphr.finished.intro.1
  SAY @46504 /* Ah, there you are. I've been waiting for you. I hope you are alive and well? */
  = @46505 /* The bone doll is finished. Almost. It merely needs a spark of life for the finishing touch. Now hold still. It doesn't hurt much. */
  + ~LevelGT(LastTalkedToBy, 1)~ + @46506 /* What are you-- */ DO ~SetGlobal("A7!GolemBuildState", "LOCALS", 2) ClearAllActions() StartCutSceneMode() StartCutScene("a7!ctbd1")~ EXIT
  + ~LevelLT(LastTalkedToBy, 2)~ + @46506 /* What are you-- */ DO ~SetGlobal("A7!GolemBuildState", "LOCALS", 2) ClearAllActions() StartCutSceneMode() StartCutScene("a7!ctbd2")~ EXIT
END

IF ~Allegiance(LastTalkedToBy, PC) GlobalGT("HelpNemphre", "GLOBAL", 1) Global("A7!GolemBuildState", "LOCALS", 1) GlobalTimerExpired("A7!GolemBuildTimer", "LOCALS") !Global("A7!GolemLifeForce", "LOCALS", 0)~ nemphr.finished.1
  SAY @46507 /* There you are. Your bone doll is complete. You know what comes next. Please hold still for a moment. */
  IF ~LevelGT(LastTalkedToBy, 1)~ DO ~SetGlobal("A7!GolemBuildState", "LOCALS", 2) ClearAllActions() StartCutSceneMode() StartCutScene("a7!ctbd1")~ EXIT
  IF ~LevelLT(LastTalkedToBy, 2)~ DO ~SetGlobal("A7!GolemBuildState", "LOCALS", 2) ClearAllActions() StartCutSceneMode() StartCutScene("a7!ctbd2")~ EXIT
END

// Finished taking life force
IF ~GlobalGT("HelpNemphre", "GLOBAL", 1) Global("A7!GolemBuildState", "LOCALS", 2) GlobalTimerExpired("A7!GolemBuildTimer", "LOCALS") Global("A7!GolemLifeForce", "LOCALS", 0)~ nemphr.finished.intro.2
  SAY @46508 /* Hmm. You are certainly resilient, my good <MANWOMAN>. */
  ++ @46509 /* What have you done to me?! */ + nemphr.finished.intro.3
END

IF ~~ nemphr.finished.intro.3
  SAY @46510 /* Didn't I tell you that I needed a bit of your life force? Don't worry too much about it. You will regenerate over time. A good night's rest should suffice. */
  IF ~~ DO ~SetGlobal("A7!GolemLifeForce", "LOCALS", 1)~ + nemphr.finished.2
END

IF ~GlobalGT("HelpNemphre", "GLOBAL", 1) Global("A7!GolemBuildState", "LOCALS", 2) GlobalTimerExpired("A7!GolemBuildTimer", "LOCALS") !Global("A7!GolemLifeForce", "LOCALS", 0)~ nemphr.finished.2
  SAY @46511 /* Now take your bone doll and go. */
  IF ~~ DO ~SetGlobal("A7!GolemBuildState", "LOCALS", 0)~ EXIT
END

// Refuse work if you are good or heroic
IF ~GlobalGT("HelpNemphre", "GLOBAL", 1) OR(2) Alignment(Player1, MASK_GOOD) ReputationGT(Player1, 15)~ nemphr.good
  SAY #15019  /* ~I have little need of one such as you.~ */
  IF ~~ EXIT
END

IF ~GlobalGT("HelpNemphre", "GLOBAL", 1) !Alignment(Player1, MASK_GOOD) ReputationLT(Player1, 16) OR(2) PartyHasItemIdentified("a7!tombd") !Global("A7!GolemBuildIntro", "LOCALS", 0)~ nemphr.intro
  SAY @46512 /* Ah, the fool returns. What does it want this time? */
  + ~PartyHasItemIdentified("a7!tombd") Global("A7!GolemBuildIntro", "LOCALS", 0)~ + @46513 /* How about a deal? I came across a curious tome that deals with the grisly details of constructing some weird kind of golems. I thought you might be interested? */ DO ~SetGlobal("A7!GolemBuild", "MYAREA", 1) SetGlobal("A7!GolemBuildIntro", "LOCALS", 1) TakePartyItemNum("a7!tombd", 1) AddexperienceParty(2000)~ + nemphr.order.intro.1
  + ~!Global("A7!GolemBuildIntro", "LOCALS", 0)~ + @46514 /* I'd like to commission the construction of a bone doll. */ + nemphr.order.1
  ++ @46515 /* I don't want anything. Goodbye. */ EXIT
END

IF ~~ nemphr.order.intro.1
  SAY @46516 /* Give it to me! Hmm... this is interesting indeed. I take it you want one for yourself? */
  ++ @46517 /* Yes. Can you do it? */ DO ~AddJournalEntry(@49010, QUEST)~ + nemphr.order.intro.2
END

IF ~~ nemphr.order.intro.2
  SAY @46518 /* Of course. But are you able meet my needs? */
  = @46519 /* I need a complete set of bones for the golem body. Moreover, I need a means to animate it. But that is for later. And I'm not doing it for free. Pay me 2000 gold up front or don't waste my time any further. */
  + ~PartyGoldGT(1999) PartyHasItem("a7!bone")~ + @46520 /* Certainly, here it is. */ DO ~TakePartyItemNum("a7!bone", 1) TakePartyGold(2000)~ + nemphr.order.accepted.1
  + ~PartyGoldLT(200)~ + @46521 /* I don't have enough money right now. Perhaps later. */ + nemphr.order.refused
  + ~PartyGoldGT(1999) !PartyHasItem("a7!bone")~ + @46522 /* I don't have the set of bones. Perhaps later. */ + nemphr.order.refused
  ++ @46523 /* I'm not really interested. Goodbye. */ EXIT
END

IF ~~ nemphr.order.1
  SAY @46524 /* Certainly. Do you have a set of bones and the 2000 gold? */
  + ~PartyGoldGT(1999) PartyHasItem("a7!bone")~ + @46525 /* Yes, here it is. */ DO ~TakePartyItemNum("a7!bone", 1) TakePartyGold(2000)~ + nemphr.order.accepted.1
  + ~PartyGoldLT(2000)~ + @46521 /* I don't have enough money right now. Perhaps later. */ + nemphr.order.refused
  + ~PartyGoldGT(1999) !PartyHasItem("a7!bone")~ + @46522 /* I don't have the set of bones. Perhaps later. */ + nemphr.order.refused
  ++ @46523 /* I'm not really interested. Goodbye. */ EXIT
END

IF ~~ nemphr.order.accepted.1
  SAY @46526 /* It looks like everything is in order. Construction will take a day. Come back alive and well tomorrow. You won't regret it. */
  IF ~~ DO ~SetGlobal("A7!GolemBuildState", "LOCALS", 1) SetGlobalTimer("A7!GolemBuildTimer", "LOCALS", ONE_DAY)~ EXIT
END

IF ~~ nemphr.order.refused
  SAY @46527 /* Then you are of no further use to me. Return only when you have everything I need. */
  IF ~~ EXIT
END

END
