//C.cfc
component {
	function f(required struct struct){
		var once = struct["key"];
		var twice = struct["key"];
		var threeTimes = struct["key"];

		writeDump(var=variables, label="C variables scope");
		return [once,twice,threeTimes];

	}
}