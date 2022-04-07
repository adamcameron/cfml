<cfcomponent>

	<cffunction name="f" returntype="array" output="false">
		<cfscript>
			var q = queryNew("col1,col2");
			// sample data
			queryAddRow(q); querySetCell(q, "col1", "Marmoset");  querySetCell(q, "col2", "dummy"); 
			queryAddRow(q); querySetCell(q, "col1", "Pangolin");  querySetCell(q, "col2", "dummy"); 
			queryAddRow(q); querySetCell(q, "col1", "Ocelot");  querySetCell(q, "col2", "dummy"); 
			queryAddRow(q); querySetCell(q, "col1", "Badger");  querySetCell(q, "col2", "dummy"); 
			
			return q["col1"].toArray();
		</cfscript>
	</cffunction>

</cfcomponent>