<cfxml variable="x">
	<simians>
	<ape id="Greater">
		<ape id="Chimp" />
		<ape id="Gorilla" />
	</ape>
	<ape id="Lesser">
		<ape id="Gibbon" />
		<ape id="Grant" />
	</ape>
	</simians>
</cfxml>

<!--- <cfset a = xmlSearch(x, "//ape[@id='Gibbon']")>
<cfdump var="#a#"> --->

<cfset a = xmlSearch(x, "//ape[contains('Gibbon,Grant',@id)]")>
<cfdump var="#a#">