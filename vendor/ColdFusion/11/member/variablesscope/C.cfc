component {

	public function distinctPublicFunction(){
		return "G'day from #getFunctionCalledName()#<br>";
	}

	public  function count(){
		return "G'day from #getFunctionCalledName()#<br>";
	}

	private function distinctPrivateFunction(){
		return "G'day from #getFunctionCalledName()#<br>";
	}

	private  function keyList(){
		return "G'day from #getFunctionCalledName()#<br>";
	}


	public function testPublicUnscoped(){
		writeOutput("<hr><h3>testPublicUnscoped</h3>");
		writeOutput("distinctPublicFunction(): #distinctPublicFunction()#");
		writeOutput("count(): #count()#");
		try {
			writeOutput("isEmpty(): #isEmpty()#");
		}catch (any e) {
			writeOutput("#e.type# #e.message# #e.detail#<br>");
		}

	}

	function testVariablesScoped(){
		writeOutput("<hr><h3>testVariablesScoped</h3>");
		writeOutput("variables.distinctPublicFunction(): #variables.distinctPublicFunction()#");
		try {
			writeOutput("this.distinctPrivateFunction(): #variables.distinctPrivateFunction()#");
		}catch (any e) {
			writeOutput("#e.type# #e.message# #e.detail#<br>");
		}
		writeOutput("variables.count(): #variables.count()#");
		try {
			writeOutput("variables.isEmpty(): #variables.isEmpty()#");
		}catch (any e) {
			writeOutput("#e.type# #e.message# #e.detail#<br>");
		}
	}


	public function testPrivateUnscoped(){
		writeOutput("<hr><h3>testPrivateUnscoped</h3>");
		writeOutput("distinctPrivateFunction(): #distinctPrivateFunction()#");
		writeOutput("keyList(): #keyList()#");
	}

	function testThisScoped(){
		writeOutput("<hr><h3>testThisScoped</h3>");
		try {
			writeOutput("this.distinctPublicFunction(): #this.distinctPublicFunction()#");
		}catch (any e) {
			writeOutput("#e.type# #e.message# #e.detail#<br>");
		}
		try {
			writeOutput("this.distinctPrivateFunction(): #this.distinctPrivateFunction()#");
		}catch (any e) {
			writeOutput("#e.type# #e.message# #e.detail#<br>");
		}
		try {
			writeOutput("this.keyList(): #this.keyList()#");
		}catch (any e) {
			writeOutput("#e.type# #e.message# #e.detail#<br>");
		}
		try {
			writeOutput("this.isEmpty(): #this.isEmpty()#");
		}catch (any e) {
			writeOutput("#e.type# #e.message# #e.detail#<br>");
		}
	}

}