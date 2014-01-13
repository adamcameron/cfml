<!---outputOnFunction.cfm--->

<cfset notInCfoutput = "this is within cfoutput tags<br>">
<cfset inCfoutput = "this is not within cfoutput tags">


<cffunction name="notSpecified">
	#notInCfoutput#
	<cfoutput>#inCfoutput#</cfoutput>
</cffunction>


<cffunction name="specifiedTrue" output="true">
	#notInCfoutput#
	<cfoutput>#inCfoutput#</cfoutput>
</cffunction>


<cffunction name="specifiedFalse" output="false">
	#notInCfoutput#
	<cfoutput>#inCfoutput#</cfoutput>
</cffunction>

<cfset notSpecified()>
<hr>
<cfset specifiedTrue()>
<hr>
<cfset specifiedFalse()>
<hr>