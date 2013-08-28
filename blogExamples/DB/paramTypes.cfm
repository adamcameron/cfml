<cfscript>
	rainbow = queryNew("");
	queryAddColumn(rainbow, "id", "integer", [1,2,3,4,5,6,7]);
	queryAddColumn(rainbow, "maori", "varchar", ["whero","karaka","kowhai","kakariki","kikorangi","tawatawa","mawhero"]);
	queryAddColumn(rainbow, "english", "varchar", ["red","orange","yellow","green","blue","indigo","violet"]);

	writeDump(rainbow);
</cfscript>

<cfquery name="colour" dbtype="query">
	SELECT	*
	FROM	rainbow
	WHERE	id = <cfqueryparam value="#URL.id#" type="integer">
</cfquery>
<cfdump var="#colour#">