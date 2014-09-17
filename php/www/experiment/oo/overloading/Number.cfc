// Number.cfc
component accessors=true {

	property english;
	property maori;

	public function onMissingMethod(){
		writeDump(var=arguments, label="#getFunctionCalledName()#() call caught by onMissingMethod()");
	}

}