<cfsilent>
<cfsetting showdebugoutput="false">
<cfset table = fileRead(expandPath("./paralympicMedalTable.html"), "UTF-8")>
<cfset jsResponse = '#URL.callback#(#URL.handler#({table:"#jsStringFormat(table)#"}));'>
</cfsilent><cfcontent reset="true" type="application/json"><cfoutput>#jsResponse#</cfoutput>