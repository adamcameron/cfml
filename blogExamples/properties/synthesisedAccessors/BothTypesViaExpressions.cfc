// BothTypesViaExpressions.cfc
component {

	variables.f = function(){
		writeOutput("private method<br>");
	};

	this.f = function(){
		writeOutput("public method<br>");
	};

	function proxy(){
		variables.f();
		this.f();
		f();
	}

}