component {
	variables.member = 20;

	private String function method() {
		return "hello";
	}

	public string function publicMethod (String name) {
		var localVar = member + 5;
		var localVar2 = "Parameter: #name#";
		return function() {
			return "#member# #name# #localVar# #localVar2# #method()#";
		};
	}

	public string function publicMethod2 (String name) {
		local.localVar = member + 5;
		local.localVar2 = "Parameter: #name#";
		return function() {
			local.localVar = "zxcv";
			writeDump(var=local);
			return "#member# #name# #local.localVar# #localVar2# #method()#";
		};
	}    
}