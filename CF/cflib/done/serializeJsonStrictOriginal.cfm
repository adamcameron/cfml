<cfscript>
string function serializeJsonStrict(required any jsonVar)
	{
		// string & number & boolean & date will be doublequoted
		if (isSimpleValue(jsonVar))				
			return '"' & jsStringformat(jsonVar) & '"';
		
		// object, not supported
		if (isObject(jsonVar))
			throw (message="object not supported");
		
		// struct
		if (isStruct(jsonVar))					
		{
			var json = "";

			for (local.key in jsonVar)
			{
				if (structKeyExists(jsonVar, key))
					json = listAppend(json, '"' & jsStringformat(key) & '":' & serializeJsonStrict(jsonVar[key]));
				else
					json = listAppend(json, '"' & jsStringformat(key) & '":null');
			}

			return '{' & json & '}';
		}
		
		if (isArray(jsonVar))
		{
			var json = "";
			
			for (var i = 1; i <= arrayLen(jsonVar); i++)
			{
				if (arrayIsDefined(jsonVar, i))
					json = listAppend(json, serializeJsonStrict(jsonVar[i]));
				else
					json = listAppend(json, "null");
			}
			
			return '[' & json & ']';
		}
	}	
</cfscript>

<cfset st.src = 1.23456 * 10^6>
<cfset st.src = []>
<cfset st.src[1] = "one">
<cfset st.src[3] = "three">

<cfset st.strict.json = serializeJsonStrict(st.src)>
<cfset st.strict.result = deserializeJson(st.strict.json)>
<cfset st.normal.json = serializeJson(st.src)>
<cfset st.normal.result = deserializeJson(st.normal.json)>

<cfdump var="#st#">
