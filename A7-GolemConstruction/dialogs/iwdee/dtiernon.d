// *** IWDEE: Tiernon Denthelm, dwarven weaponsmith at Gloomfrost ***

// States to append: 
// 16: She feared I'd go tell the rest o' me Clan that I'd seen her in the Gloomfrost. She didn't want me bringing any o' me brothers here—or anyone else.
// 26: An' so that's why I came here—bringing me forge an' all me tools.
// 27: That's the bite o' the iron, stranger—without me eyes, I can't fully see me work, so I labor here, with two hands an' nothing to work on.
// 33: I can hear ye tramping around like a giant in a cave of icicles, stranger—what ye be wantin' now?
// 46: Aye... so anything *else* ye be wanting?
// 59: That's what I'm afraid of, stranger—that's what the last one who held her did. Best ye be gone, now.
// 78: Anything else ye be wantin'?
// 12: There ye be—that'll serve ye as a key to see her, if ye're determined to. Now get along with ye, an' watch yerself in these caves.
// 17: Ye'll do no such thing. The matter's laid to rest between me an' her, an' it's none o' yer business. Ye leave avenging to me when *I* feel it necessary, hear?
// 28: Pah! Ye know not what ye say—if ye were present, a bit o' ye'd go into the making as well, an' a strange thing that'd be.
// 32: Use it with me good graces, friend—I might be catchin' some shut-eye soon; working that ice mined the strength out o' me.

EXTEND_TOP ~dtiernon~ 16 26 27 33 46 59 78
  + ~Global("A7!GolemAbility", "GLOBAL", 1) Global("A7!GloomfrostWorkshop", "GLOBAL", 0)~ + @123000 /* Your forge is impressive. Can I use it to construct golems in this place? */ + tiernon.1
END

EXTEND_TOP ~dtiernon~ 12
  + ~Global("A7!GolemAbility", "GLOBAL", 1) Global("A7!GloomfrostWorkshop", "GLOBAL", 0)~ + @123001 /* I couldn't help but notice your impressive forge. Before I go, would you allow me to use it for constructing golems in this place? */ + tiernon.1
END

EXTEND_TOP ~dtiernon~ 17
  + ~Global("A7!GolemAbility", "GLOBAL", 1) Global("A7!GloomfrostWorkshop", "GLOBAL", 0)~ + @123002 /* I understand. Your forge is impressive, Tiernon. Can I use it to construct golems in this place? */ + tiernon.1
END

EXTEND_TOP ~dtiernon~ 28
  + ~Global("A7!GolemAbility", "GLOBAL", 1) Global("A7!GloomfrostWorkshop", "GLOBAL", 0)~ + @123003 /* If you say so? I have noticed your impressive forge. Can I use it to construct golems in this place? */ + tiernon.1
END

EXTEND_TOP ~dtiernon~ 32
  + ~Global("A7!GolemAbility", "GLOBAL", 1) Global("A7!GloomfrostWorkshop", "GLOBAL", 0)~ + @123004 /* I couldn't help but notice your impressive forge. Before you go rest, would you allow me to use it for constructing golems in this place? */ + tiernon.1
END

APPEND ~dtiernon~
  IF ~~ tiernon.1
    SAY @123005 /* Eh? The forge is like a part of m'self. But be my guest if ye insist so much. Just don't be hammerin' it to oblivion with yer clumsy smithing skills. */
    ++ @123006 /* Thank you, Tiernon. */ DO ~SetGlobal("A7!GloomfrostWorkshop", "GLOBAL", 1) SetRestEncounterProbabilityDay(0) SetRestEncounterProbabilityNight(0) AddAreaType(CANRESTOTHER) AddJournalEntry(@140006, QUEST)~ EXIT
  END
END
