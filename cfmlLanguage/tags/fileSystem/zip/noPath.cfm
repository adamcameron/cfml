<cfset sThisDir = expandPath('./')>

<cfzip action="zip" file="#sThisDir#dest/nopath.zip" overwrite="false" storepath="true">
	<cfzipparam source="#sThisDir#src/nopath/" recurse="true">
</cfzip>

<cfzip	action			= "list"
		file			= "#sThisDir#dest/nopath.zip"
		name			= "qMunks"
		recurse			= "true"
		showDirectory	= "true"
>
<cfdump var="#qMunks#">