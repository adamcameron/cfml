<cffile action="write" file="#expandPath('./text.html')#" charset="utf-8">
	<cfinclude template="./inc.cfm">
	<cfoutput>#sMsg# @ #now()#</cfoutput>
</cffile>