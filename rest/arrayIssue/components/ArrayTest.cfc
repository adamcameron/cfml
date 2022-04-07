// ArrayTest.cfc
component rest=true restPath="arrayTest" {

	remote array function returnsArray() httpmethod="get" restpath="returnsArray" {
		return ["tahi","rua","toru","wha","rima","ono","whitu","waru","iwa","tekau"];
	}

}