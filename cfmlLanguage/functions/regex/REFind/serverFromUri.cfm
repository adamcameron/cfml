<cfflush interval="16">
<cfset sRegex = "^(?:\w+://)?([a-zA-Z0-9\.-]+)(?:(?:/|\?){0,}.*)?$">
<cfset sRegex = "^.*?://(.+?)[/|?|]*$">
<cfsavecontent variable="lUrls">
[protocol]://[server]/path?arg=val,
[protocol]://[server]/path?arg=val#anchor,
[protocol]://[server]/path?arg,
[protocol]://[server]/path?arg#anchor,
[protocol]://[server]/path?,
[protocol]://[server]/path?#anchor,
[protocol]://[server]/path,
[protocol]://[server]/path#anchor,
[protocol]://[server]/,
[protocol]://[server]/#anchor,
[protocol]://[server],
[protocol]://[server]#anchor,
[protocol]://[server]/?arg=val,
[protocol]://[server]/?arg=val#anchor,
[protocol]://[server]/?arg,
[protocol]://[server]/?arg#anchor,
[protocol]://[server]/?,
[protocol]://[server]/?#anchor,
[protocol]://[server]?arg=val,
[protocol]://[server]?arg=val#anchor,
[protocol]://[server]?arg,
[protocol]://[server]?arg#anchor,
[protocol]://[server]?,
[protocol]://[server]?#anchor,
[server]/path?arg=val,
[server]/path?arg=val#anchor,
[server]/path?arg,
[server]/path?arg#anchor,
[server]/path?,
[server]/path?#anchor,
[server]/path,
[server]/path#anchor,
[server]/,
[server]/#anchor,
[server],
[server]#anchor,
[server]/?arg=val,
[server]/?arg=val#anchor,
[server]/?arg,
[server]/?arg#anchor,
[server]/?,
[server]/?#anchor,
[server]?arg=val,
[server]?arg=val#anchor,
[server]?arg,
[server]?arg#anchor,
[server]?,
[server]?#anchor
</cfsavecontent>
<cfset lServers = "127.0.0.1,localhost,stackoverflow.com">
<cfloop index="sProtocol" list="http,ftp">
	<cfloop index="sServer" list="#lServers#">
		<cfloop index="sUrl" list="#lUrls#">
			<cfset sUrl = trim(sUrl)><!--- remove CRLF --->
			<cfset sUrl = replace(sUrl, "[protocol]", sProtocol)>
			<cfset sUrl = replace(sUrl, "[server]", sServer)>

			<cfset stMatch = reFind(sRegex, sUrl, 1, true)>
			<cfif arrayLen(stMatch.pos) EQ 2 AND stMatch.pos[2]>
				<cfset sServerFromUrl = mid(sUrl, stMatch.pos[2], stMatch.len[2])>
				<cfoutput>Extracted #sServerFromUrl# from #sUrl#</cfoutput>
				<cfif listFind(lServers, sServerFromUrl)>
					good match<br />
				<cfelse>
					BAD MATCH<br />
				</cfif>
			<cfelse>
				<cfoutput>No match in #sUrl#<br /></cfoutput>
				<cfdump var="#stMatch#">
			</cfif>
		</cfloop>
	</cfloop>
</cfloop>
