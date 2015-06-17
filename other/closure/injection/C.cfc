// C.cfc

component {

	public C function init(required any value){
		variables.value = arguments.value;
		return this;
	}

	public void function dumpVariables(){
		writeDump(var=variables, label="Object variables via dumpVariables()");
	}

	public struct function wrapperForInjectedFunction(){
		injectedFunction();
	}

}