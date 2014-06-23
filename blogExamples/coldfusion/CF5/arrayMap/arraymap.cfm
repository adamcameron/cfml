<cfif thistag.HasEndTag>
	<cfthrow type="IllegalClosingTag" message="The 'arraymap' tag must not have a closing tag">
</cfif>
<cfparam name="attributes.array" type="array">
<cfparam name="attributes.callback">
<cfparam name="attributes.returnVariable">

<cfif NOT isCustomFunction(attributes.callback)>
	<cfthrow type="InvalidArgumentException" message="The 'callback' attribute must be a function">
</cfif>

<cfset mappedArray = arrayNew(1)>
<cfloop index="i" from="1" to="#arrayLen(attributes.array)#">
	<cfset arrayAppend(mappedArray, attributes.callback(attributes.array[i], i, attributes.array))>
</cfloop>
<cfset "caller.#attributes.returnVariable#" = mappedArray>