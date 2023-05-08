Top<br>
hasEndTag: <cfoutput>#thisTag.hasEndTag#</cfoutput><br>
<cfif thisTag.executionMode eq "start">
	Start<br>
<cfelseif thisTag.executionMode eq "end">
	Content: <cfoutput>#thisTag.generatedContent#</cfoutput><br>
	End<br>
<cfelse>
	Err: <cfoutput>#thisTag.executionMode#</cfoutput><br>
</cfif>
Bottom<br>