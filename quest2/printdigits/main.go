package main

import (
	"github.com/01-edu/z01"
)

func main() {

	for ch := '0'; ch <= '9'; ch++ {
		z01.PrintRune(ch)
	}
	z01.PrintRune('\n')

}
