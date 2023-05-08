<cfflush interval="64">
<cfset sBaseUrl = "http://localhost:#CGI.SERVER_PORT#/shared/cf/cfml/function/remoteMimeTypes/c.cfc">

<cfset lDataTypes="string,xml,struct">
<cfset lReturnTypes="Default,Plain,Wddx,Json">
<cfloop index="sDataType" list="#lDataTypes#">
	<cfloop index="sReturnType" list="#lReturnTypes#">
		<cfset sMethod = "#sDataType#As#sReturnType#">
		<cfset sUrl = "#sBaseUrl#?method=#sMethod#">
		<cfhttp method="get" url="#sUrl#" result="stHttp" />
		<cfdump var="#stHttp#" label="#sUrl#">
	</cfloop>
</cfloop>