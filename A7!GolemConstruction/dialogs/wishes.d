// *** Adding new replies to Limied Wish and Wish dialogs ***

// Limited Wish
EXTEND_BOTTOM ~wish~ 1
  + ~Global("A7!TomeGolemMithral", "GLOBAL", 1) PartyHasItem("a7!iron") CheckStatLT(LastTalkedToBy, 14, WIS) Global("a7!wishMithral", "GLOBAL", 0)~ + 
      @41506 /* I wish for my iron to be turned into mithral. */ DO ~SetGlobal("a7!wishMithral", "GLOBAL", 1)~ + Limited.Mithral.Low
  + ~Global("A7!TomeGolemMithral", "GLOBAL", 1) PartyHasItem("a7!iron") CheckStatGT(LastTalkedToBy, 13, WIS) Global("a7!wishMithral", "GLOBAL", 0)~ + 
      @41507 /* I wish for a single piece of my iron to be turned into mithral. */ DO ~SetGlobal("a7!wishMithral", "GLOBAL", 1)~ + Limited.Mithral.High
  + ~Global("A7!TomeGolemAdamantite", "GLOBAL", 1) PartyHasItem("a7!iron") CheckStatLT(LastTalkedToBy, 14, WIS) Global("a7!wishAdamantine", "GLOBAL", 0)~ + 
      @41500 /* I wish for my iron to be turned into adamantine. */ DO ~SetGlobal("a7!wishAdamantine", "GLOBAL", 1)~ + Limited.Adamantine.Low
  + ~Global("A7!TomeGolemAdamantite", "GLOBAL", 1) PartyHasItem("a7!iron") CheckStatGT(LastTalkedToBy, 13, WIS) Global("a7!wishAdamantine", "GLOBAL", 0)~ + 
      @41501 /* I wish for a single piece of my iron to be turned into adamantine. */ DO ~SetGlobal("a7!wishAdamantine", "GLOBAL", 1)~ + Limited.Adamantine.High
END

APPEND ~wish~
  IF ~~ Limited.Mithral.Low
    SAY @41508 /* It is done, master. All your iron has been turned into a single piece of mithral. */
    IF ~~ DO ~TakePartyItemAll("a7!iron") DestroyItem("a7!iron") GiveItemCreate("a7!mith", LastTalkedToBy, 1, 0, 0)
              SetInterrupt(FALSE) ForceSpell(Myself, DRYAD_TELEPORT)~ EXIT
  END

  IF ~~ Limited.Mithral.High
    SAY @41509 /* It is done, master. One iron bar in your possession has been turned into a single piece of mithral. */
    IF ~~ DO ~TakePartyItemNum("a7!iron", 1) DestroyItem("a7!iron") GiveItemCreate("a7!mith", LastTalkedToBy, 1, 0, 0)
              SetInterrupt(FALSE) ForceSpell(Myself, DRYAD_TELEPORT)~ EXIT
  END

  IF ~~ Limited.Adamantine.Low
    SAY @41502 /* It is done, master. All your iron has been turned into a single piece of adamantine. */
    IF ~~ DO ~TakePartyItemAll("a7!iron") DestroyItem("a7!iron") GiveItemCreate("a7!adam", LastTalkedToBy, 1, 0, 0)
              SetInterrupt(FALSE) ForceSpell(Myself, DRYAD_TELEPORT)~ EXIT
  END

  IF ~~ Limited.Adamantine.High
    SAY @41503 /* It is done, master. One iron bar in your possession has been turned into a single piece of adamantine. */
    IF ~~ DO ~TakePartyItemNum("a7!iron", 1) DestroyItem("a7!iron") GiveItemCreate("a7!adam", LastTalkedToBy, 1, 0, 0)
              SetInterrupt(FALSE) ForceSpell(Myself, DRYAD_TELEPORT)~ EXIT
  END
END


// Wish
EXTEND_BOTTOM ~wish25~ 12
  + ~Global("A7!TomeGolemMithral", "GLOBAL", 1) PartyHasItem("a7!iron") CheckStatLT(LastTalkedToBy, 14, WIS)~ + @41510 /* Turn all your iron into a single piece of mithral. */
      DO ~TakePartyItemAll("a7!iron") DestroyItem("a7!iron") GiveItemCreate("a7!mith", LastTalkedToBy, 1, 0, 0) ApplySpell(Myself, POOF_GONE)~ EXIT
  + ~Global("A7!TomeGolemMithral", "GLOBAL", 1) PartyHasItem("a7!iron") CheckStatGT(LastTalkedToBy, 13, WIS)~ + @41511 /* Turn a single piece of iron into mithral. */
      DO ~TakePartyItemNum("a7!iron", 1) DestroyItem("a7!iron") GiveItemCreate("a7!mith", LastTalkedToBy, 1, 0, 0) ApplySpell(Myself, POOF_GONE)~ EXIT
  + ~Global("A7!TomeGolemAdamantite", "GLOBAL", 1) PartyHasItem("a7!iron") CheckStatLT(LastTalkedToBy, 14, WIS)~ + @41504 /* Turn all your iron into a single piece of adamantine. */
      DO ~TakePartyItemAll("a7!iron") DestroyItem("a7!iron") GiveItemCreate("a7!adam", LastTalkedToBy, 1, 0, 0) ApplySpell(Myself, POOF_GONE)~ EXIT
  + ~Global("A7!TomeGolemAdamantite", "GLOBAL", 1) PartyHasItem("a7!iron") CheckStatGT(LastTalkedToBy, 13, WIS)~ + @41505 /* Turn a single piece of iron into adamantine. */
      DO ~TakePartyItemNum("a7!iron", 1) DestroyItem("a7!iron") GiveItemCreate("a7!adam", LastTalkedToBy, 1, 0, 0) ApplySpell(Myself, POOF_GONE)~ EXIT
END
