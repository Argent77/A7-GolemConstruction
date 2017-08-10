// *** Quest 1: Pseudo dialog used for various triggered situations in temple area ***

BEGIN ~a7!td1~

// Party member holding lock of hair detected
IF ~Global("A7!Q1HairDetected", "MYAREA", 1)~ 0
  SAY @47000 /* (The lock of Nyalee's hair starts to emit a faint glow when you approach the central area of the temple.) */
  + ~HasItem("a7!misc1", LastTalkedToBy)~ + @47001 /* (Place the hair on the ground.) */ + 1
  ++ @47002 /* (Ignore the glow.) */ EXIT
END

IF ~~ 1
  SAY @47003 /* (As soon as the hair touches the ground it burns to ashes in a bright flash. Soon after you hear a faint rumble from deep underground.) */
  IF ~~ DO ~SetGlobal("A7!Q1HairDetected", "MYAREA", 2) DestroyItem("a7!misc1") StartCutSceneMode() StartCutScene("a7!ct20")~ UNSOLVED_JOURNAL @49011 EXIT
END


// Non-living creature attempts to enter the maze
IF ~Global("A7!Q1EnterMaze", "MYAREA", 1)~ 10
  SAY @47004 /* (This creature should withstand the poisonous clouds of the maze.) */
  ++ @47008 /* (Enter the maze.) */
    DO ~SetGlobal("A7!Q1EnterMaze", "MYAREA", 0)
        SetGlobal("A7!Q1PartyDisabled", "GLOBAL", 1)
        ApplySpellRES("a7!q1ad", Myself)
        LeaveAreaLUAPanic("A77!01", "", [3062.712], SWW)
        LeaveAreaLUA("A77!01", "", [3062.712], SWW)~ EXIT
  ++ @47006 /* (Don't enter the maze.) */ DO ~SetGlobal("A7!Q1EnterMaze", "MYAREA", 0)~ EXIT
END

// Summoned creature attempts to enter the maze
IF ~Global("A7!Q1EnterMaze", "MYAREA", 2)~ 11
  SAY @47007 /* (You will lose control over summoned creatures as soon as they enter the maze.) */
  ++ @47006 /* (Don't enter the maze.) */ DO ~SetGlobal("A7!Q1EnterMaze", "MYAREA", 0)~ EXIT
END

// Living creature attempts to enter the maze
IF ~Global("A7!Q1EnterMaze", "MYAREA", 3)~ 11
  SAY @47005 /* (Living beings can't hope to survive down there. You are well-advised to stay clear of the maze.) */
  ++ @47006 /* (Don't enter the maze.) */ DO ~SetGlobal("A7!Q1EnterMaze", "MYAREA", 0)~ EXIT
END
