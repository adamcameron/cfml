component rest=true {

	remote string function get(required string name restargsource="query") httpmethod="get" {
		return "G'day #arguments.name#!";
	}
}