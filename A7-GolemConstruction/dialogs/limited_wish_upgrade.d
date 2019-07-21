// *** Adding new replies: Golem upgrades ***

// Limited Wish
EXTEND_BOTTOM ~wish~ 1
  + ~Global("a7!wishGolemUpgrade", "GLOBAL", 0) Global("A7!GolemAbility", "GLOBAL", 1) RandomNum(2, 1) CheckStatLT(LastTalkedToBy, 15, WIS) Detect([FAMILIAR.0.0.0.A7!GOLEM])
     OR(4) CheckSpellState([FAMILIAR.0.0.0.A7!GOLEM], A7!GOLEM_LESSER) CheckSpellState([FAMILIAR.0.0.0.A7!GOLEM], A7!GOLEM_NORMAL) CheckSpellState([FAMILIAR.0.0.0.A7!GOLEM], A7!GOLEM_GREATER) CheckSpellState([FAMILIAR.0.0.0.A7!GOLEM], A7!GOLEM_PERFECT)~ +
      @41512 /* I wish for my golem to improve. */ DO ~SetGlobal("a7!wishGolemUpgrade", "GLOBAL", 1)~ + Limited.Downgrade

  + ~Global("a7!wishGolemUpgrade", "GLOBAL", 0) Global("A7!GolemAbility", "GLOBAL", 1) RandomNum(4, 1) CheckStatGT(LastTalkedToBy, 14, WIS)
     Detect([FAMILIAR.0.0.0.A7!GOLEM]) OR(3) CheckSpellState([FAMILIAR.0.0.0.A7!GOLEM], A7!GOLEM_LESSER) CheckSpellState([FAMILIAR.0.0.0.A7!GOLEM], A7!GOLEM_NORMAL) CheckSpellState([FAMILIAR.0.0.0.A7!GOLEM], A7!GOLEM_GREATER)~ +
      @41513 /* I wish for my golem to improve in mind and body. */ DO ~SetGlobal("a7!wishGolemUpgrade", "GLOBAL", 1)~ + Limited.Upgrade

  + ~Global("a7!wishGolemUpgrade", "GLOBAL", 0) Global("A7!GolemAbility", "GLOBAL", 1) RandomNum(4, 1) CheckStatGT(LastTalkedToBy, 14, WIS)
     Detect([FAMILIAR.0.0.0.A7!GOLEM]) CheckSpellState([FAMILIAR.0.0.0.A7!GOLEM], A7!GOLEM_PERFECT)~ +
      @41513 /* I wish for my golem to improve in mind and body. */ + Limited.Upgrade.Perfect
END

APPEND ~wish~
  IF ~~ Limited.Downgrade
    SAY @41514 /* Granted. Your golem's experience will be reset, so that it gets the chance to improve again. */
    IF ~~ DO ~ReallyForceSpellRES("A7!DEX", [FAMILIAR.0.0.0.A7!GOLEM]) SetInterrupt(FALSE) ForceSpell(Myself, DRYAD_TELEPORT)~ EXIT
  END

  IF ~~ Limited.Upgrade
    SAY @41516 /* Granted. I will promote your golem to a higher state of being. */
    IF ~~ DO ~ReallyForceSpellRES("A7!PRX", [FAMILIAR.0.0.0.A7!GOLEM]) SetInterrupt(FALSE) ForceSpell(Myself, DRYAD_TELEPORT)~ EXIT
  END

  IF ~~ Limited.Upgrade.Perfect
    SAY @41515 /* I do not have the power to enhance your golem any further. You will have to choose another wish. */
    IF ~~ + 1
  END
END
