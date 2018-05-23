package main

import (
	"math/rand"
	"testing"
	"time"
)

func TestFail(t *testing.T) {
	t.Errorf("fail")
}

func TestPass(t *testing.T) {}

func TestFlaky(t *testing.T) {
	rand.Seed(time.Now().UnixNano())

	num := rand.Intn(10)

	if num%2 != 0 {
		t.Errorf("fail, number was %d", num)
	}
}
