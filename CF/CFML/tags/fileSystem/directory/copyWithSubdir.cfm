<cfset thisDir = expandPath('.') & "\">
<cfset srcDir = thisDir & "copy.src">
<cfset dstDir = thisDir & "copy.dst">
<cfdirectory action="copy" directory="#srcDir#" destination="#dstDir#" recurse="true">

<cfdirectory action="list" directory="#thisDir#" name="listing" recurse="true">
<cfdump var="#variables#">