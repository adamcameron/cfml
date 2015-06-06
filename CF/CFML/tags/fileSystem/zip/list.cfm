<cfset sThisDir = expandPath('./')>
<cfzip	action			= "list"
		file			= "#sThisDir#/dest/nopath.zip"
		name			= "qFiles"
		recurse			= "true"
		showDirectory	= "true"
>
<cfdump var="#qFiles#">