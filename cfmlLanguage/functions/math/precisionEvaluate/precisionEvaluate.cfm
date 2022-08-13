<cfset myVar = "foo">
<cfset myVarName = "myVar">

<cfoutput>
	#evaluate(myVarName)#<br />
	#precisionEvaluate(myVarName)#<br />
</cfoutput>