component {
	
	variables.setInCfc = true;
	
	function getClosure(){
		
		writeOutput("in getClosure(), variables.setInCfc: #variables.setInCfc#<br>");
		var f = function(){
			variables.setInClosure = true;
			writeOutput("in closure, variables.setInCfc: #variables.setInCfc#<br>");
			writeOutput("in closure, variables.setInClosure: #variables.setInClosure#<br>");
		};
		//writeOutput("in getClosure(), variables.setInClosure: #variables.setInClosure#<br>");
		return f;
	}
	
	function callClosure(f){
		writeOutput("in callClosure(), variables.setInCfc: #variables.setInCfc#<br>");
		f();
		writeOutput("in callClosure(), variables.setInClosure: #variables.setInClosure#<br>");
	}
	
	this.callCLosureViaClosure = function(f){
		writeOutput("in callClosure(), variables.setInCfc: #variables.setInCfc#<br>");
		f();
		writeOutput("in callClosure(), variables.setInClosure: #variables.setInClosure#<br>");
	};
	
}