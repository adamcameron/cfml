// C.cfc
component {

	function f(){
		var a = new api.packageA.A()
		return a.packageVar
	}

}