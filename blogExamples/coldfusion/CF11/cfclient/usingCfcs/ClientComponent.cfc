component client=true {
	normalComponent = new NormalComponent();

	public function f(){
		return "G'day world";
	}

	public function g(){
		return normalComponent.g();
	}
}