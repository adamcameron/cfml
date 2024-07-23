component {
	public any function sayHello(string name) {
		var text = 'Hello ' & arguments.name;
		var sayAlert = "";
		sayAlert = closure() {
			writeOutput(text);
		};
		return sayAlert;
	}

    function countDownFrom(count) {
        var iCount = count;
        c = closure() {
            return iCount--;
        };
        return c;
    }
	
}