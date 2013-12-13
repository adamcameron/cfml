<br /><br />
<cfscript>
files = directoryList(expandPath("./"));
writeDump(var=files, top=5);	
</cfscript>
<br /><br /><hr /><br /><br />
<cfdirectory action="list" directory="#expandPath('./')#" name="files">
<cfdump var="#files#" top="5">
<br /><br />