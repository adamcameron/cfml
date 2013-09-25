component {

	this.name		= "docs02";
	this.thisPath	= getDirectoryFromPath(getCurrentTemplatePath());
 	this.mappings	= {
 		"/me/adamcameron"	= this.thisPath & "../me/adamcameron", 
		"/javaloader"		= this.thisPath & "../com/compoundtheory/javaloader",
		"/jsoup"	 		= this.thisPath & "../org/jsoup",
		"/cfmldocs"	 		= this.thisPath & "../cfmldocs"
	};


}