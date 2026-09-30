// Go sample
/* block comment */
package main

import (
	"errors"
	"fmt"
)

type Shape interface {
	Area() float64
}

type Rect struct {
	Width, Height float64
}

func (r Rect) Area() float64 { return r.Width * r.Height }

func find(items map[string]int, key string) (int, error) {
	if value, ok := items[key]; ok {
		return value, nil
	}
	return 0, errors.New("missing")
}

func main() {
	items := map[string]int{"alpha": 1_000, "beta": 0xFF}
	ch := make(chan rune, 1)
	go func() { ch <- 'x' }()
	for name := range items {
		value, _ := find(items, name)
		fmt.Printf(`%s = %d`+"\n", name, value)
	}
	defer fmt.Println(Rect{2.5, 4}.Area(), <-ch)
}
