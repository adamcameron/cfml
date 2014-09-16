// Test.cfc
component accessors=true {

	property type="numeric" name="score" default=3;

	public function getPropertyMetadata(){
		return getMetadata().properties;
	}

	public function dumpScore(message){
		writeOutput("#message#:<br>");
		writeOutput("Exists in variables scope: #structKeyExists(variables, "score")#<br>");
		writeOutput("Exists in this scope: #structKeyExists(this, "score")#<br>");
		writeOutput("<hr>");
	}

}