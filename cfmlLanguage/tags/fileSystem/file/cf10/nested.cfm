<cffile action="write" file="#expandPath('./text1.html')#">
	<cfset sMsg = "Hello World (outer)">
	<cfoutput>#sMsg# @ #now()#</cfoutput>
	<cffile action="write" file="#expandPath('./text2.html')#">
		<cfset sMsg = "Hello World (inner)">
		<cfoutput>#sMsg# @ #now()#</cfoutput>
	</cffile>	
</cffile>