<cfscript>
// query.cfm

rainbow = queryNew("");
rainbow.addColumn("id", "integer", [1,2,3,4,5,6,7]);
rainbow.addColumn("en", "varchar", ["red","orange","yellow","green","blue","indigo","violet"]);
rainbow.addColumn("mi", "varchar", ["whero","karaka","kowhai","kakariki","kikorangi","tawatawa","mawhero"]);
writeDump(rainbow);
</cfscript>