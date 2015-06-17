<cfset sDir = getDirectoryFromPath(getCurrentTemplatePath())>
<cfdirectory action="list" directory="#sDir#" name="qDirs1" type="dir" recurse="false">
<cfdirectory action="list" directory="#sDir#" name="qDirs2" type="dir" recurse="true">

<cfdump var="#variables#">
