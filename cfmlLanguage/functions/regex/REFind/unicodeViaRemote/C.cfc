<cfcomponent>

	<cfcontent type="text/plain">
	
	<cffunction name="f" returntype="struct" access="remote">
		<cfscript>
		var result = {
			found = reFind("[\u0080-\uFFFF]", s),
			string = htmlEditFormat(s)
		};
		var i = 0;
		var c = '';
		var char = {};
		
		result.chars = [];
		for (i=1; i <= len(s); i++){
			c = mid(s, i, 1);
			char = {c=c, asc=asc(c)};
			arrayAppend(result.chars, char);
		}
		
		return result;
		</cfscript>
	</cffunction>
</cfcomponent>