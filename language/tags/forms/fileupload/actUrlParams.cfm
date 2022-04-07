<cfsavecontent variable="sDump">
	<cfdump var="#URL#">
</cfsavecontent>
<cffile action="write" file="#expandPath('./dump.html')#" output="#sDump#">
