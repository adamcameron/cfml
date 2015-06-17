<!--- --------------------------------------------------------------------------------------- ----

Blog Entry:
The Performance Cost Of Throwing Exceptions In ColdFusion

Author:
Ben Nadel / Kinky Solutions

Link:
http://www.bennadel.com/index.cfm?dax=blog:1652.view

Date Posted:
Jul 17, 2009 at 6:54 PM

---- --------------------------------------------------------------------------------------- --->


<cffunction access="public" output="false" name="doSomething" returntype="array" hint="I append a value to an array with the option to throw and catch an error.">
	<cfargument name="data" type="array" required="true" hint="I am the array to which we are appending a value.">
	<cfargument name="value" type="any" required="true" hint="I am the value being appended to the array.">
	<cfargument name="throwException" type="string" required="true" hint="I determine if we are going to throw an exception.">
	
	<!--- Append the given value to the array. --->
	<cfset arrayAppend(arguments.data, arguments.value)>
	
	<!--- Check to see if we need to trigger an exception. --->
	<cfif arguments.throwException eq "throw">
		<cftry>
			<!--- Throw manual exception. --->
			<cfthrow type="manualException">
			
			<cfcatch>
			<!--- Nothing to do here. --->
			</cfcatch>
		</cftry>
	<cfelseif arguments.throwException eq "create">
		<cfset e = createObject("java", "java.lang.Exception").init()> 
	</cfif>
	
	<!--- Return the updated array. --->
	<cfreturn arguments.data>
</cffunction>



<!---
Loop over the true/false boolean flag for triggernig an
exception in the target method.
--->
<cfloop index="throwException" list="throw,create,none">
	<cfoutput><p>Throw Exception: #throwException#</p></cfoutput>

	<!--- Get start tick count. --->
	<cfset startTickCount = getTickCount()>
	
	<!--- Create a new array. --->
	<cfset data = []>
	
	<!--- Call the method many times to test performance. --->
	<cfloop index="iteration" from="1" to="1000">
		<!---
		Call the method and store the result back into our
		data variable (so that it grows over time). We will
		be using the outer loop to manage the exceptions.
		--->
		<cfset data = doSomething(data,	iteration, throwException)>
	</cfloop>
	
	<!--- Get the end tick count. --->
	<cfset endTickCount = getTickCount()>
	
	<cfoutput><p>Results: #numberFormat( (endTickCount - startTickCount), "," )#</p></cfoutput>

</cfloop>