component {

	remote string function remoteMethodGrandparent(){
		return "From Grandparent.remoteMethodGrandparent()";
	}

	public string function publicMethodGrandparent(){
		return "From Grandparent.publicMethodGrandparent()";
	}

	package string function packageMethodGrandparent(){
		return "From Grandparent.packageMethodGrandparent()";
	}

	private string function privateMethodGrandparent(){
		return "From Grandparent.privateMethodGrandparent()";
	}

	string function unspecifiedAccessMethodGrandparent(){
		return "From Child.unspecifiedAccessMethodGrandarent()";
	}

}