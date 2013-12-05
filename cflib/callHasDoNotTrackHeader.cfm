<cfhttp method="get" url="http://localhost:8500/scribble/shared/git/cflib/hasDoNotTrackHeader.cfm" result="httpResponse">
	<cfhttpparam type="header" name="DNT" value="1">
</cfhttp>

<cfdump var="#httpResponse#">