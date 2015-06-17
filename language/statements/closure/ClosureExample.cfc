component {
	function getClosureFunction(condition){
		var x = "";
		if (condition eq 'string'){
			x = closure(String str1, str2){
				return condition;
			};
		}else{
			x = closure(int1, int2){
				return 0;
			};
		}
		return x;
	}
}