package expreduce

type singleParamQType (func(Ex) bool)
type singleParamQLogType (func(Ex, *CASLogger) bool)
type evalFnType (func (*Expression, *EvalState) Ex)

func singleParamQEval(fn singleParamQType) evalFnType {
	return (func(this *Expression, es *EvalState) Ex {
		if len(this.Parts) != 2 {
			return this
		}
		if fn(this.Parts[1]) {
			return &Symbol{"True"}
		}
		return &Symbol{"False"}
	})
}

func singleParamQLogEval(fn singleParamQLogType) evalFnType {
	return (func(this *Expression, es *EvalState) Ex {
		if len(this.Parts) != 2 {
			return this
		}
		if fn(this.Parts[1], &es.CASLogger) {
			return &Symbol{"True"}
		}
		return &Symbol{"False"}
	})
}

func numberQ(e Ex) bool {
	_, ok := e.(*Integer)
	if ok {
		return true
	}
	_, ok = e.(*Flt)
	if ok {
		return true
	}
	_, ok = e.(*Rational)
	if ok {
		return true
	}
	return false
}

func vectorQ(e Ex) bool {
	l, isL := HeadAssertion(e, "List")
	if isL {
		for i := 1; i < len(l.Parts); i++ {
			_, subIsL := HeadAssertion(l.Parts[i], "List")
			if subIsL {
				return false
			}
		}
		return true
	}
	return false
}

func matrixQ(e Ex, cl *CASLogger) bool {
	l, isL := HeadAssertion(e, "List")
	if isL {
		return len(dimensions(l, 0, cl)) == 2
	}
	return false
}
