<cfsetting showdebugoutput="false" >
<cfparam name="URL.requestId" default="#createUuid()#">
<cfoutput>#URL.requestId#:#getTickCount()#</cfoutput>