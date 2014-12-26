// assignmentInConditionalExpression.go
package main

import "fmt"

func main() {
	a:=1
	b:=2
	if a=b {
		fmt.Println("yup")
	}else{
		fmt.Println("nup")
	}
	fmt.Printf("%d %d", a, b)
}