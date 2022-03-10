component {

	include "./myLib.cfm"

	public function callMyLibPublicMethodFromMyComponent() {
		return myLibPublicMethod()
	}

	public function callMyLibPrivateMethodFromMyComponent() {
		return myLibPrivateMethod()
	}

	public function myComponentPublicMethod() {
		return "#getFunctionCalledName()# called"
	}

	private function myComponentPrivateMethod() {
		return "#getFunctionCalledName()# called"
	}

}