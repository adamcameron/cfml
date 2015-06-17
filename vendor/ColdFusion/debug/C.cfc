// C.cfc
component {

	remote void function f(){
		writeOutput(getFunctionCalledName());
	}
}