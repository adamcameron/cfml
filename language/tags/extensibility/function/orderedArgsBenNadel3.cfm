<cffunction name="echoArguments">
<cfargument name="girl1">
<cfargument name="girl2"> 
<!---
NOTE: In this demo, we are not going to define any
CFArgument tags - we are just going to let the invocation
context define the arguments.
--->
 
<!--- Return the arguments. --->
<cfreturn arguments>
</cffunction>

<cfset myArguments = {}>
<cfset myArguments[ 1 ] = "Katie (1st Arg)">
<cfset myArguments[ 2 ] = "Colleen (2nd Arg)">

<cfset result = echoArguments( argumentCollection = myArguments )>
 
<!--- Output the results. --->
<cfdump var="#result#" label="Method Invocation">