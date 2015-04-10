// BaselineAccessingStaticVariable.cfc
component {

	logger = new Logger()
	echo("statement in the pseudo-constructor<br>")
	logger.writeToLog(file="BaselineAccessingStaticVariable", text="statement in the pseudo-constructor")

	static {
		echo("statement in the static constructor<br>")
		static.logger = new Logger()
		static.logger.writeToLog(file="BaselineAccessingStaticVariable", text="statement in the static constructor")
		static.myVar = 17
	}

	static function f(){
		echo("statement in the static method<br>")
		static.logger.writeToLog(file="BaselineAccessingStaticVariable", text="statement in the static method")
	}

	function init(){
		echo("statement in the object constructor<br>")
		logger.writeToLog(file="BaselineAccessingStaticVariable", text="statement in the object constructor")
	}


}