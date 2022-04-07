<cfloop file="#expandPath('./charset.txt')#" index="sLine" charset="UTF-8">
	<cfoutput>#sLine#</cfoutput><br />
</cfloop>