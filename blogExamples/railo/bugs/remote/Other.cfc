// Other.cfc
component{

	public function callMe(string optional1,string optionalString1FromBase, optionalString2FromBase){
		if (structKeyExists(arguments, "optional1") && isSimpleValue(arguments.optional1)){
			arguments.optional1AsStruct = {optional1 = arguments.optional1};
		}
		writedump(var=arguments, format="text", label="#getMetaData(this).fullname# #getFunctionCalledName()#()");
	}
}