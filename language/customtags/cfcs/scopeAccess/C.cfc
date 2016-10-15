component {

	somePrivateVar = "variables scope";
	this.somePublicVar = "this scope";

	function f(){
		var someLocalVar = "local scope";
		cfmodule(template="myModule.cfm");
	}
	
}
