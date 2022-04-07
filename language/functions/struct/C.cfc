component {
	this.somePublicVariable = "visible externally";
	variables.somePrivateVariable = "not visible externally";

	public string function somePublicMethod(){
		return "visible externally";
	}
}