// C.cfc
component {

	public struct function getStructWithUniqueKeys(required numeric iterations){
		var struct = {};
		for (var i=1; i <= iterations; i++){
			struct[getId()] = true;
		}
		return struct;
	}

	private string function getId(){
		// some convoluted way of generating a key which we don't want to test
		return ""; // doesn't matter what it is, we won't be using it
	}

}