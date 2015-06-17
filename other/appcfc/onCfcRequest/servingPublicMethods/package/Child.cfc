// Child.cfc
component extends="Parent" {

	remote string function remoteMethod(){
		return "From Child.remoteMethod()";
	}

	public string function publicMethod(){
		return "From Child.publicMethod()";
	}

	package string function packageMethod(){
		return "From Child.packageMethod()";
	}

	private string function privateMethod(){
		return "From Child.privateMethod()";
	}

	string function unspecifiedAccessMethod(){
		return "From Child.unspecifiedAccessMethod()";
	}

}