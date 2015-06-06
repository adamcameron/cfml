<cfsilent>
	<cfset sUrl = serializeJson(URL)>
<cflog file="gifTest" type="information" text="Remote call received. Payload: #sUrl#">
</cfsilent><cfcontent type="image/gif" reset="true">