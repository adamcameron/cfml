<cfscript>
array function getComponentProperties(required any bean, array properties = [])
	output="true"
{
	var metaData = !isObject(arguments.bean)?getComponentMetaData(arguments.bean):getMetaData(arguments.bean);
	var extends = structKeyExists(metaData, "extends")?structFind(metaData, "extends"):{};

	arrayAppend(arguments.properties, structKeyExists(metaData, "properties")?structFind(metaData, "properties"):[]);

	return structKeyExists(extends, "name")?getComponentProperties(structFind(extends, "name"), arguments.properties):arguments.properties;
}	
</cfscript>

<cfdump var="#getComponentMetadata('Child')#">
<cfdump var="#structFindKey(getComponentMetadata('Child'), 'properties', 'all')#">
<cfdump var="#getComponentProperties('Child')#">