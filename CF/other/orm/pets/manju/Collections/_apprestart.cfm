<cfscript>
	//instantiate admin object
	myObj = createObject("component","cfide.adminapi.administrator");
	foo = myObj.login("admin");

	myObj2 = createObject ("component", "cfide.adminapi.runtime");
	myObj2.STOPAPPLICATION("ORM_Collections");
</cfscript>

<cfscript>
	//logout
	myObj.logout();
</cfscript>
