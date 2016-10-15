package cas

import (
	"fmt"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestInterp(t *testing.T) {
	fmt.Println("Testing interp")

	es := NewEvalState()

	assert.Equal(t, "(1 + 2)", Interp("1  + 2").String())
	assert.Equal(t, "3", Interp("  1  + 2 ").Eval(es).String())
	assert.Equal(t, "3", EvalInterp("  1  + 2 ", es).String())
	assert.Equal(t, "4", EvalInterp("1+2-3+4", es).String())
	// Test that multiplication takes precedence to addition
	assert.Equal(t, "8", EvalInterp("1+2*3+1", es).String())
	assert.Equal(t, "6", EvalInterp("1+2*3-1", es).String())
	assert.Equal(t, "-6", EvalInterp("1-2*3-1", es).String())

	// Test proper behavior of unary minus sign
	assert.Equal(t, "-15", EvalInterp("5*-3", es).String())
	assert.Equal(t, "15", EvalInterp("-5*-3", es).String())
}
