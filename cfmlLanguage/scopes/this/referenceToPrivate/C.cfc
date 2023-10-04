component {

	public function testViaThis() {
		return this.privateMethod()
	}

	public function testViaVariables() {
		return variables.privateMethod()
	}

	public function testViaNoScope() {
		return privateMethod()
	}

	private function privateMethod() {
		return "yup"
	}

	this.testThisViaFunctionExpression = () => this.privateMethod()
	this.testVariablesViaFunctionExpression = () => variables.privateMethod()
	this.testNoScopeViaFunctionExpression = () => privateMethod()
}
