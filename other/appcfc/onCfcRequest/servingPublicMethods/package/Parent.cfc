component extends="Grandparent" {

	remote string function remoteMethodParent(){
		return "From Parent.remoteMethodParent()";
	}

	public string function publicMethodParent(){
		return "From Parent.publicMethodParent()";
	}

	package string function packageMethodParent(){
		return "From Parent.packageMethodParent()";
	}

	private string function privateMethodParent(){
		return "From Parent.privateMethodParent()";
	}

	string function unspecifiedAccessMethodParent(){
		return "From Child.unspecifiedAccessMethodParent()";
	}

}