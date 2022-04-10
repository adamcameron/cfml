<cfset sThisDir = expandPath('./')>

<cfzip action="zip" file="#sThisDir#dest/munks.zip" overwrite="false" storepath="false">
	<cfzipparam source="#sThisDir#src/" recurse="true">
</cfzip>

<cfzip	action			= "list"
		file			= "#sThisDir#dest/munks.zip"
		name			= "qMunks"
		recurse			= "true"
		showDirectory	= "true"
>
<cfdump var="#qMunks#">