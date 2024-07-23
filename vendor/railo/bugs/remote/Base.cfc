// Base.cfc
component {

	remote function runner(string optionalString1="", optionalString2=""){
		writedump(var=arguments, format="text", label="#getMetaData(this).fullname# #getFunctionCalledName()#()");

		var other = new Other();
		other.callMe(optionalString1FromBase=optionalString1, optionalString2FromBase=optionalString2);
	}

}