package expreduce

import "math/big"

func GetNumberTheoryDefinitions() (defs []Definition) {
	defs = append(defs, Definition{
		Name: "PrimeQ",
		Usage: "`PrimeQ[n]` returns True if `n` is prime, False otherwise.",
		Attributes: []string{"Listable"},
		legacyEvalFn: singleParamQEval(primeQ),
		SimpleExamples: []TestInstruction{
			&SameTest{"True", "PrimeQ[5]"},
			&SameTest{"False", "PrimeQ[100]"},
			&SameTest{"True", "PrimeQ[982451653]"},
			&SameTest{"True", "PrimeQ[-2]"},
		},
		FurtherExamples: []TestInstruction{
			&TestComment{"`PrimeQ` only works for Integers:"},
			&SameTest{"False", "PrimeQ[5.]"},
		},
		Tests: []TestInstruction{
			&SameTest{"False", "PrimeQ[0]"},
			&SameTest{"False", "PrimeQ[1]"},
			&SameTest{"False", "PrimeQ[-1]"},
			&SameTest{"False", "PrimeQ[0.5]"},
		},
	})
	defs = append(defs, Definition{
		Name: "GCD",
		Usage: "`GCD[n1, n2, ...]` finds the greatest common denominator of the integer inputs.",
		Attributes: []string{"Flat", "Listable", "OneIdentity", "Orderless"},
		legacyEvalFn: func(this *Expression, es *EvalState) Ex {
			zero := big.NewInt(0)
			var ints [](*big.Int)
			for i := 1; i < len(this.Parts); i++ {
				asInt, isInt := this.Parts[i].(*Integer)
				if !isInt {
					return this
				}
				r := asInt.Val.Cmp(zero)
				if r > 0 {
					ints = append(ints, asInt.Val)
				}
				if r < 0 {
					tmpI := big.NewInt(0)
					tmpI.Neg(asInt.Val)
					ints = append(ints, tmpI)
				}
			}
			if len(ints) == 0 {
				return &Integer{zero}
			}
			gcd := ints[0]
			for i := 1; i < len(ints); i++ {
				gcd.GCD(nil, nil, gcd, ints[i])
			}
			return &Integer{gcd}
		},
		SimpleExamples: []TestInstruction{
			&SameTest{"3", "GCD[9, 6]"},
			&SameTest{"5", "GCD[100, 30, 15]"},
		},
		Tests: []TestInstruction{
			&SameTest{"1", "GCD[9, 2]"},
			&SameTest{"10", "GCD[100, 0, 10]"},
			&SameTest{"3", "GCD[9, 3]"},
			&SameTest{"10", "GCD[100, 30, 10]"},
			&SameTest{"10", "GCD[100, 30]"},
			&SameTest{"1", "GCD[100, 30, -1]"},
			&SameTest{"10", "GCD[100, 30, -60]"},
			&SameTest{"60", "GCD[-60, -60, -60]"},
			&SameTest{"GCD[-60, -60, -0.5]", "GCD[-60, -60, -0.5]"},
			&SameTest{"GCD[0.5]", "GCD[0.5]"},
			&SameTest{"GCD[1, a]", "GCD[1, a]"},
			&SameTest{"GCD[a, a]", "GCD[a, a]"},
			&SameTest{"0", "GCD[]"},
			&SameTest{"1", "GCD[1]"},
			&SameTest{"GCD[a]", "GCD[a]"},
			&SameTest{"1000", "GCD[1000]"},
		},
	})
	defs = append(defs, Definition{
		Name: "LCM",
		Usage: "`LCM[n1, n2, ...]` finds the least common multiple of the inputs.",
		SimpleExamples: []TestInstruction{
			&SameTest{"70", "LCM[5, 14]"},
			&SameTest{"2380", "LCM[5, 14, 68]"},
			//&SameTest{"2/3", "LCM[2/3, 1/3]"},
			//&SameTest{"10/3", "LCM[2/3, 1/3, 5/6]"},
			//&SameTest{"30", "LCM[2/3, 1/3, 5/6, 3]"},
			//&SameTest{"{2/3,10/3,6}", "LCM[2/3, {1/3, 5/6, 3}]"},
		},
		Tests: []TestInstruction{
			//&SameTest{"{10/3,10/3,30}", "LCM[2/3, {1/3, 5/6, 3}, 5/6]"},
			&SameTest{"LCM[a,b]", "LCM[a, b]"},
			&SameTest{"LCM[a,b,c]", "LCM[a, b, c]"},
			&SameTest{"LCM[5,6,c]", "LCM[5, 6, c]"},
		},
	})
	return
}
