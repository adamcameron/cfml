// Test.cfc
component rest=true restpath="test" {

	import "cfcs.*";

	remote struct function testMethod() httpmethod="get" restpath="" produces="application/json" {
		var thing = new Thing();
		thing.setKey("foo");
		return {key=thing.key};
	}

}