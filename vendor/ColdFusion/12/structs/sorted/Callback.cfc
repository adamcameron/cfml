component extends=structs.sorted.Simple {

	function run(){
		super.run();
	}

	function getTestStruct(){
		var sorted = structNew("sorted", function(key1,key2){
			var key1AsString = key1.toString();
			var key2AsString = key2.toString();
			var key1Len = key1AsString.len();
			var key2Len = key2AsString.len();
			var keyComparison = sgn(key1Len-key2Len);
			if (keyComparison) return keyComparison; // sort by length first
			return compareNoCase(key1,key2); // within that, sort on key name
		});
		sorted.first = 2;
		sorted.second = 5;
		sorted.third = 3;
		sorted.fourth = 4;
		sorted.fifth = 1;
		return sorted;
	}

	function getExpectedKeysFromTestStruct(){
		return "fifth,first,third,fourth,second";
	}

}
