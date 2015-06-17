// Test.cfc
component restPath="/demo" rest=true {

	remote string function greet() httpmethod="GET" {
		return "G'day World @ #now()#";
	}

	remote string function error() httpmethod="GET" restpath="/error" {
		throw(type="MethodFailedException", message="MethodFailedException was thrown");
	}

}