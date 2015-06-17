// InScript.cfc
 
/** 
* @hint This CFC is implemented entirely in script
*/ 
component extends="Base" {

	 pageEncoding "utf-8";	

	/**
	* @hint 				This is a function which tags three arguments and does nothing with them 
	* @meta:someAnnotation 	Its value
	* @reqdArg 				We need to pass this one
	* @defaultedOptionalArg This one has a default value if it's not passed
	* @optionalArg 			This one is entirely optional
	*/ 
	public void function someMethod(required string reqdArg, string defaultedOptionalArg="a default value", string optionalArg){

	}

}
