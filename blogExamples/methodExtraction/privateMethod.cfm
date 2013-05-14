<cfscript>
	// privateMethod.cfm

	param name="URL.dynamicMethod" default="somePublicMethod";

	myObj = new My();

	myStaticallyNamedMethod = myObj[URL.dynamicMethod];

	result = myStaticallyNamedMethod();
</cfscript>