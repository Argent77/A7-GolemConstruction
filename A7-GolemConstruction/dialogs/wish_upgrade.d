// *** Adding new replies: Golem upgrades ***

// Wish
EXTEND_BOTTOM ~wish25~ 12
  + ~Global("A7!GolemAbility", "GLOBAL", 1) RandomNum(5, 1) CheckStatLT(LastTalkedToBy, 15, WIS) Detect([FAMILIAR.0.0.0.A7!GOLEM])
     OR(4) CheckSpellState([FAMILIAR.0.0.0.A7!GOLEM], A7!GOLEM_LESSER) CheckSpellState([FAMILIAR.0.0.0.A7!GOLEM], A7!GOLEM_NORMAL) CheckSpellState([FAMILIAR.0.0.0.A7!GOLEM], A7!GOLEM_GREATER) CheckSpellState([FAMILIAR.0.0.0.A7!GOLEM], A7!GOLEM_PERFECT)~ +
    @41517 /* Demote one of your golems. */ DO ~ApplySpellRES("A7!DEX", [FAMILIAR.0.0.0.A7!GOLEM]) ApplySpell(Myself, POOF_GONE)~ EXIT
  + ~Global("A7!GolemAbility", "GLOBAL", 1) RandomNum(10, 1) CheckStatGT(LastTalkedToBy, 14, WIS)
     Detect([FAMILIAR.0.0.0.A7!GOLEM]) OR(3) CheckSpellState([FAMILIAR.0.0.0.A7!GOLEM], A7!GOLEM_LESSER) CheckSpellState([FAMILIAR.0.0.0.A7!GOLEM], A7!GOLEM_NORMAL) CheckSpellState([FAMILIAR.0.0.0.A7!GOLEM], A7!GOLEM_GREATER)~ +
    @41518 /* Promote one of your golems. */ DO ~ApplySpellRES("A7!PRX", [FAMILIAR.0.0.0.A7!GOLEM]) ApplySpell(Myself, POOF_GONE)~ EXIT
END
