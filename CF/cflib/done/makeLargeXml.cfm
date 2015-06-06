<cfset stMain = {}>

<cfset st = {
	s	= "tahi,rua,toru,wha",
	a	= ["tahi", "rua", "toru", "wha"],
	st = {tahi="one", rua="two", toru="three", wha="four"}
}>

<cfset stThis = stMain>
<cfset parents = []>
<cfset parents[1] = stMain>

<cfloop index="i" from="1" to="2500">

	<cfset newKey = createUuid()>
	<cfset stThis[newKey] = duplicate(st)>

	<cfset shift = randRange(1,20)> 
	<cfif shift eq 20>
		<cfset stThis = parents[1]>	
		<cfset arrayDeleteAt(parents, 1)>
	<cfelseif shift ge 15>	
		<cfset arrayPrepend(parents, stThis)>
		<cfset stThis = stThis[newKey]>	
	</cfif>
</cfloop>
<cfwddx action="cfml2wddx" input="#stMain#" output="w">
<cffile action="write" file="#expandPath('./large.xml')#" output="#w#">