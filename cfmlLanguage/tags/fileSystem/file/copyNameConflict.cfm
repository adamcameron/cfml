<cfset dir = getDirectoryFromPath(getCurrentTemplatePath())>
<cfset source = dir & "copyNameConflict.src">
<cfset dest = dir & "copyNameConflict.dest">

<cffile action="copy" source="#source#" destination="#dest#" nameconflict="makeunique">

<cfdirectory action="list" directory="#dir#" name="listing" filter="copyNameConflict.*">
<cfdump var="#listing#">