<cfscript>
function StructDeepExists(structure, structurePath) {
	/* Now do the StructKeyExists and recurse through the list of struct keys. */
	var exists = StructKeyExists(structure, ListFirst(structurePath, ".")) 
								? ListLen(structurePath, '.') gt 1 
									? StructDeepExists(structure[ListFirst(structurePath, ".")], ListRest(structurePath, '.')) 
								 		: true
								 : false;

	return exists;
}	
</cfscript>

<cfset str["b-ob"]["f~red"]["jane"]["bob"]["fred"]["jane"]["bob"]["fred"]["jane"]["bob"]["fred"]["jane"]["bob"]["fred"]["jane"]["bob"]["fred"]["jane"]["bob"]["fred"]["jane"]["bob"]["fred"]["jane"] = {}>
<cfoutput>
#StructDeepExists(str, "b-ob.f~red.jane.bob.fred.jane.bob.fred.jane.bob.fred.jane.bob.fred.jane.bob.fred.jane.bob.fred.jane.bob.fred.jane")#
#isDefined("str.b-ob.f~red.jane.bob.fred.jane.bob.fred.jane.bob.fred.jane.bob.fred.jane.bob.fred.jane.bob.fred.jane.bob.fred.jane")#
</cfoutput>