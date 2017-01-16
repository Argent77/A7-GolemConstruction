// *** Adding new replies to Wish dialog (IWDEE) ***

// Wish
EXTEND_BOTTOM ~wish25~ 12
  + ~Global("A7!TomeGolemMithral", "GLOBAL", 1) PartyHasItem("a7!iron") CheckStatLT(LastTalkedToBy, 14, WIS)~ + @41510 /* Turn all your iron into a single piece of mithral. */
      DO ~TakePartyItemAll("a7!iron") DestroyItem("a7!iron") GiveItemCreate("a7!mith", LastTalkedToBy, 1, 0, 0) ApplySpell(Myself, POOF_GONE)~ EXIT
  + ~Global("A7!TomeGolemMithral", "GLOBAL", 1) PartyHasItem("a7!iron") CheckStatGT(LastTalkedToBy, 13, WIS)~ + @41511 /* Turn a single piece of iron into mithral. */
      DO ~TakePartyItemNum("a7!iron", 1) DestroyItem("a7!iron") GiveItemCreate("a7!mith", LastTalkedToBy, 1, 0, 0) ApplySpell(Myself, POOF_GONE)~ EXIT
END
