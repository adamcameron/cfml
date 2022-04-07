// C.cfc
component {
	public C function init(){
		include "udf.cfm";
		return this;
	}

	public function callsMixedInDateFunctionCorrectly(){
		return mixedInDateFunction(date=now());
	}

	public function callsMixedInDateFunctionIncorrectly(){
		return caller(function(){
			return mixedInDateFunction(date="NOT_A_DATE");
		});
	}

	private function caller(required function f){
		return f();
	}

}