<cfscript>
public function myLibPublicMethod() {
	return "#getFunctionCalledName()# called"
}	

private function myLibPrivateMethod() {
	return "#getFunctionCalledName()# called"
}

public function callMyComponentPublicMethodFromMyLib() {
	return myComponentPublicMethod()
}

public function callMyComponentPrivateMethodFromMyLib() {
	return myComponentPrivateMethod()
}
</cfscript>