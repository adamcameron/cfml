component rest=true httpmethod="post" {

	remote string function greet(required string name) {
		return "G'day, #name#";
	}

}