// *** WK: Aesgareth on Level 3 ***

// TODO: Remove these command if necessary
REPLACE_SAY ~gorcamb~ 31 @43000 /* Excellent. I have access to a Spectral Brand, a scroll of wish and a tome of knowledge, all rather impressive items. And there is the gem as well. What would you wish to play for? */
REPLACE_SAY ~gorcamb~ 65 @43001 /* Excellent. I have access to a Spectral Brand, a scroll of wish and a tome of knowledge, all rather impressive items. And there is the gem, of course. What would you wish to play for? */

EXTEND_BOTTOM ~gorcamb~ 31 65 #1
  + ~Global("A7!CambionTome", "GLOBAL", 0)~ + @43002 /* I will play for the tome of knowledge. */ DO ~SetGlobal("CambionWager", "GLOBAL", 167)~ + 32
END

EXTEND_BOTTOM ~gorcamb~ 50
  IF ~Global("CambionWager", "GLOBAL", 167)~ DO ~TriggerActivation("Tran3014", TRUE) TriggerActivation("Tran3016", TRUE) AddXP2DA("PLOT2A")~ + gorcamb.tome.1
END

APPEND ~gorcamb~
  IF ~~ gorcamb.tome.1
    SAY @43003 /* You desire the tome of knowledge, and here it is. If you wish to play again, I'd appreciate a chance to gain my freedom, friend. */
    IF ~~ DO ~IncrementGlobal("GamesPlayed", "GLOBAL", 1) 
              SetGlobal("DrawEffect", "GLOBAL", 0) 
              SetGlobal("A7!CambionTome", "GLOBAL", 1) 
              SetGlobal("PlayerWager", "GLOBAL", 0) 
              GiveItem("a7!tom0b", LastTalkedToBy)~ EXIT
  END
END
