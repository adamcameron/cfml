component rest=true restPath="greet" {

	remote string function inNewZealandEnglish(required string name restargsource="path") httpmethod="get" restpath="inNewZealandEnglish/{name}" {
		return "G'day, #arguments.name#";
	}

	remote string function inMaori(required string name restargsource="path") httpmethod="get" restpath="inMaori/{name}" {
		return "Kia ora, #arguments.name#";
	}

}