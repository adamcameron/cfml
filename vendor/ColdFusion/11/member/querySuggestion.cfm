<cfscript>
// querySugggestion.cfm
query = new Q()
		.new("")
		.addColumn("id", "integer", [1,2,3,4,5,6,7])
		.addColumn("en", "varchar", ["red","orange","yellow","green","blue","indigo","violet"])
		.addColumn("mi", "varchar", ["whero","karaka","kowhai","kakariki","kikorangi","tawatawa","mawhero"])
		.execute("SELECT * FROM this.records WHERE id = ?", [1], {dbtype="query"})
;
writeOutput(query.dump());
writeOutput(query.toJson());
</cfscript>