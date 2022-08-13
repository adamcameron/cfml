<cfdirectory action="list" directory="#expandPath( './hardcodedSubDirection/' )#" name="files">

<cfscript>
files = directoryList(expandPath( './hardcodedSubDirection/' ));
</cfscript>