package piscine

import (
	"github.com/01-edu/z01"
)

func PrintRange(start, end int) {
	if (start < 0 && end < 0) || (start > 9 && end > 9) {
		z01.PrintRune('\n')
		return
	}

	if start < 0 {
		start = 0
	} else if start > 9 {
		start = 9
	}

	if end < 0 {
		end = 0
	} else if end > 9 {
		end = 9
	}

	FirstIn := false

	if start <= end {
		for i := start; i <= end; i++ {
			if FirstIn {
				z01.PrintRune(' ')
			}
			z01.PrintRune(rune(i + '0'))
			FirstIn = true
		}
	} else {
		for i := start; i >= end; i-- {
			if FirstIn {
				z01.PrintRune(' ')
			}
			z01.PrintRune(rune(i + '0'))
			FirstIn = true
		}
	}
	z01.PrintRune('\n')
}
