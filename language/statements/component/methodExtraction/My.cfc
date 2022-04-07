// My.cfc

component {

	public string function somePublicMethod(){
		return somePrivateMethod();
	}

	private string function somePrivateMethod(){
		return "within a private method";
	}

}