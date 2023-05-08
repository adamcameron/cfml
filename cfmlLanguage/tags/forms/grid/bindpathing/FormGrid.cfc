<cfcomponent>


	<cffunction name="get" access="remote" output="false" returntype="struct">
		<cfargument name="cfgridpage" required="true" type="numeric">
		<cfargument name="cfgridpagesize" required="true" type="numeric">
		<cfargument name="cfgridsortcolumn" required="true" type="string">
		<cfargument name="cfgridsortdirection" required="true" type="string">
		
		<cfscript>
			var qResult = queryNew("");
			queryAddColumn(qResult, "id", listToArray("1,2,3,4,5"));
			queryAddColumn(qResult, "name", listToArray("Adam,Barbara,Charlie,Donna,Ed"));
			queryAddColumn(qResult, "active", listToArray("true,false,true,false,true"));
			
			return queryConvertForGrid(qResult, 1, 5);
		</cfscript>
	</cffunction> 


	<cffunction name="change" access="remote" output="false" returntype="struct">
		<cfargument name="cfgridaction" required="true">
		<cfargument name="cfgridrow" required="true">
		<cfargument name="cfgridchanged" required="true">
		
		<cfscript>
			return structNew();
		</cfscript>
	</cffunction> 


</cfcomponent>