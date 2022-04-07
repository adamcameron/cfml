component extends=GP {

	static {
		test = "P";
	}
	
	public function fromP(){
		return static.test;
	}
	
	public function get(){
		return static.test;
	}
}
