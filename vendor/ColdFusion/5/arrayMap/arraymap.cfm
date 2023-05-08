<!--- arrayMap.cfm --->
<cfif NOT thistag.HasEndTag>
	<cfthrow type="MissingClosingTagException" message="The 'arraymap' tag must have a closing tag">
</cfif>
<cfparam name="attributes.array" type="array">

<cfparam name="attributes.callbackArgs" type="variableName">
<cfparam name="attributes.returnVariable">


<cfset mappedArray = arrayNew(1)>
<cfif THISTAG.ExecutionMode EQ "Start">
	<cfset myArray = arrayNew(1)>
	<cfset index = 1>
	<cfset "caller.#attributes.callbackArgs#" =structNew()>
	<cfset "caller.#attributes.callbackArgs#.value" = attributes.array[index]>
	<cfset "caller.#attributes.callbackArgs#.index" = index>
	<cfset "caller.#attributes.callbackArgs#.array" = attributes.array>
<cfelse>
	<cfset index = index + 1>
	<cfif index gt arrayLen(attributes.array)>
		<cfset tempArray = arrayNew(1)>
		<cfloop index="i" from="1" to = "#arrayLen(thistag.callbackResults)#">
			<cfset arrayAppend(tempArray, thistag.callbackResults[i].value)>
		</cfloop>
		<cfset "caller.#attributes.returnVariable#" = tempArray>
		<cfexit method="exittag">
	<cfelse>
		<cfset "caller.#attributes.callbackArgs#" =structNew()>
		<cfset "caller.#attributes.callbackArgs#.value" = attributes.array[index]>
		<cfset "caller.#attributes.callbackArgs#.index" = index>
		<cfset "caller.#attributes.callbackArgs#.array" = attributes.array>
		<cfexit method="loop">
    </cfif>
</cfif>