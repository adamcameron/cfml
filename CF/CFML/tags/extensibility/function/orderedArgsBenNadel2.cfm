<cfset args = []>
<cfset args[1] = "Katie (1st Arg)">
<cfset args[2] = "Colleen (2nd Arg)">
<cfset args[3] = "nameless third arg">

<cffunction name="echoArguments"> 
	<cfargument name="namedArg1">
	<cfargument name="namedArg2">
	<cfreturn arguments>
</cffunction>

<cfinvoke method="echoArguments" returnvariable="result">
	<cfloop index="i" from="1" to="#arrayLen(args)#">
		<cfinvokeargument name="#i#" value="#args[i]#">
	</cfloop>
</cfinvoke>

<cfdump var="#result#">

