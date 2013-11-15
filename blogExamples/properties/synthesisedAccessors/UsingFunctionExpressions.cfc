// UsingFunctionExpressions.cfc
component accessors=true {

	property myProperty;

	this.setMyProperty = function(required string myProperty){
		variables.myProperty = "set by this-scoped function: " & arguments.myProperty;
		writeDump(var=this, label="from this-scoped version");
	};

	variables.setMyProperty = function(required string myProperty){
		variables.myProperty = "set by variables-scoped function: " & arguments.myProperty;
		writeDump(var=this, label="from variables-scoped version");
	};


	public void function runThemAll(required string myProperty){
		variables.setMyProperty("calling variables-scoped version with " & myProperty);
		this.setMyProperty("calling this-scoped version with " & myProperty);
		setMyProperty("calling unscoped version with " & myProperty);
	}

}