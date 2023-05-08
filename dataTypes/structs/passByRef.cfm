<cffunction name= "func">
	<cfargument name="arg">
	<cfdump var="#variables#" label="Just demonstrating what's in the mainline code">
	<br />

	<cfset arguments.arg[1].string = "updated in function">
	<cfdump var="#variables#" label="arguments.arg[1].string = ""updated in function""">
	<br />

	<cfset arguments.arg[2] = "updated in function">
	<cfdump var="#variables#" label="arguments.arg[2] = ""updated in function""">
	<br />
</cffunction>
	
<!--- just do this to keep the dumps clean --->
<cfset request.func = duplicate(func)>
<cfset structDelete(variables, "func")>
	

<cfset struct = structNew()>
<cfdump var="#variables#" label="struct = structNew(): only the struct">
<br />
<cfset struct.string = "initialised">
<cfdump var="#variables#" label="struct.string = ""initialised""">
<br />
<cfset array = arrayNew(1)>
<cfdump var="#variables#" label="array = arrayNew(1): an array and a struct">
<br />
<cfset array[1]	= struct>
<cfdump var="#variables#" label=" array[1] = struct: the array copies the struct *by reference* into the first element">
<br />
<cfset array[2]	= "simple value initialised">
<cfdump var="#variables#" label="array[2] = ""simple value"": and the array has a simple value">
<br />
<cfset request.func(array)>
<cfdump var="#variables#" label="request.func(array): mainline code, after running the function">
<br />
<cfset struct.string = "struct updated in mainline after function call">
<cfdump var="#variables#" label="struct.string = ""struct updated in mainline after function call""">
<br />
<cfset array[1].string = "array updated in mainline after function call">
<cfset array[2] = "updated in mainline">
<cfdump var="#variables#" label="array[1].string = ""array updated in mainline after function call"";  array[2] = ""updated in mainline""">
