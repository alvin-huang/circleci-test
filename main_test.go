package main

import "testing"

func TestMultiplyPositive(t *testing.T) {
	product := Multiply(1, 1)
	expected := 1

	if product != expected {
		t.Errorf("Product was incorrect, got : %d, expected: %d.", product, expected)
	}
}
