// *** SoA: Jerlia the Ore Merchant (conditional addition) ***

// Should only be added once
ADD_TRANS_TRIGGER ~scjerlia~ 37 ~False()~ DO 0 UNLESS ~"False()"~
EXTEND_TOP ~scjerlia~ 37 #1
  ++ #28743 /* Nothing, sorry I bothered you. */ + 2
END
