package expreduce

// This function assumes e and lhs have the same head and that the head is Flat.
func FlatReplace(e *Expression, lhs *Expression, rhs Ex, orderless bool, es *EvalState) {
	looseLhs := NewExpression([]Ex{})
	looseLhs.Parts = append(looseLhs.Parts, lhs.Parts[0])
	if !orderless {
		looseLhs.Parts = append(looseLhs.Parts, NewExpression([]Ex{
			&Symbol{"Pattern"},
			&Symbol{"Expreduce`start"},
			NewExpression([]Ex{&Symbol{"BlankNullSequence"}}),
		}))
	}
	looseLhs.Parts = append(looseLhs.Parts, lhs.Parts[1:]...)
	looseLhs.Parts = append(looseLhs.Parts, NewExpression([]Ex{
		&Symbol{"Pattern"},
		&Symbol{"Expreduce`end"},
		NewExpression([]Ex{&Symbol{"BlankNullSequence"}}),
	}))
	pm := EmptyPD()
	matchq, newPd := IsMatchQ(e, looseLhs, pm, es)
	if matchq {
		var tmpEx Ex
		if orderless {
			tmpEx = ReplacePD(NewExpression([]Ex{
				e.Parts[0],
				rhs,
				&Symbol{"Expreduce`end"},
			}), es, newPd)
		} else {
			tmpEx = ReplacePD(NewExpression([]Ex{
				e.Parts[0],
				&Symbol{"Expreduce`start"},
				rhs,
				&Symbol{"Expreduce`end"},
			}), es, newPd)
		}
		tmpExpr := tmpEx.(*Expression)
		e.Parts = tmpExpr.Parts
	}
}

func ReplacePDInternal(e Ex, pm *PDManager) Ex {
	asSym, isSym := e.(*Symbol)
	if isSym {
		for k, def := range pm.patternDefined {
			if k == asSym.Name {
				// Shouldn't need the copy
				return def
			}
		}
	}
	asExpr, isExpr := e.(*Expression)
	if isExpr {
		for i := range asExpr.Parts {
			asExpr.Parts[i] = ReplacePDInternal(asExpr.Parts[i], pm)
		}
	}
	return e
}

func ReplacePD(this Ex, es *EvalState, pm *PDManager) Ex {
	containsAny := false
	for k := range pm.patternDefined {
		if ContainsSymbol(this, k) {
			containsAny = true
			break
		}
	}
	if !containsAny {
		return this
	}

	// Expressions are immutable. Any time we change an expression, we must
	// first copy it.
	return ReplacePDInternal(this.DeepCopy(), pm)
}

// The goal of this function is to replace all matching expressions with the
// RHS upon successful matches. We will NOT substitute any named patterns in
// the RHS. We will merely make sure that the named patterns are added to pm.
// Final named pattern substitution will occur at the last possible time.
func ReplaceAll(this Ex, r *Expression, es *EvalState, pm *PDManager,
                stopAtHead string) Ex {
	asExpression, isExpression := this.(*Expression)

	if isExpression {
		_, isRestrictedHead := HeadAssertion(this, stopAtHead)
		if isRestrictedHead {
			return this
		} else {
			// Continue recursion
			es.Debugf("ReplaceAll(%v, %v, es, %v)", this, r, pm)
			return asExpression.ReplaceAll(r, stopAtHead, es)
		}
	}
	if res, matches := IsMatchQ(this, r.Parts[1], pm, es); res {
		return ReplacePD(r.Parts[2], es, matches)
	}
	return this
}

func Replace(this Ex, r *Expression, es *EvalState) (Ex, bool) {
	if res, matches := IsMatchQ(this, r.Parts[1], EmptyPD(), es); res {
		return ReplacePD(r.Parts[2], es, matches), true
	}
	return this, false
}
