// General.cfc
component invokeimplicitaccessor=true {
	property x;

	function getX(){
		writeoutput("getX called<br>");
		return x;
	}

	function setX(x){
		writeoutput("setX called<br>");
		variables.x = arguments.x;
	}
}
