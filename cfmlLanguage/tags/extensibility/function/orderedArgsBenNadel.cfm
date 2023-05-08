<cfset args = {}>
<cfset args[1] = "arg 1 value">
<cfset args[2] = "arg 2 value">

<cffunction name="echoArguments"> 
	<cfargument name="namedArg1">
	<cfargument name="namedArg2">
	<cfreturn arguments>
</cffunction>

<cfset result = echoArguments(argumentCollection=args)>
<cfdump var="#result#" label="numeric arg names: function notation" format="text">

<cfinvoke method="echoArguments" argumentcollection="#args#" returnvariable="result2">
<cfdump var="#result2#" label="numeric arg names: cfinvoke" format="text">

<cfset args2 = {}>
<cfset args2["arg1"] = "arg 1 value">
<cfset args2["arg2"] = "arg 2 value">


<cfset result3 = echoArguments(argumentCollection=args2)>
<cfdump var="#result3#" label="string arg names: function notation" format="text">

<cfinvoke method="echoArguments" argumentcollection="#args2#" returnvariable="result4">
<cfdump var="#result4#" label="string arg names: cfinvoke" format="text">