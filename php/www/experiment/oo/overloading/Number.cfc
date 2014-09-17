// Number.cfc
component accessors=true {

	property name="english" default="";
	property name="maori" default="";

	public function get(){
		return {english=variables.english,maori=variables.maori};
	}

	public function onMissingMethod(){
		writeDump(var=arguments, label="#getFunctionCalledName()#() call caught by onMissingMethod()");
	}

}