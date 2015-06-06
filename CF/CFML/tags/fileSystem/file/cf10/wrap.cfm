<cfsetting enablecfoutputonly="true">
<cffile action="write" file="#expandPath('./text.html')#">
	<cfset sMsg = "Hello World">
	<cfoutput>#sMsg# @ #now()#</cfoutput>
</cffile>