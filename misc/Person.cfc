// Person.cfc

component {

	this.name = "Ross"

	private this.someThingShouldBe = "should be secret"


	variables.irc = "salted"

	function getIrc(){
		return variables.irc
	}

}