<cfset personnel = new Personnel().get()>

<cfoutput query="personnel" group="country">
	<h2>#country#</h2>
	<cfoutput group="region">
		<h3>#region#</h3>
		<cfoutput group="district">
			<h4>#district#</h4>
			<cfoutput>
				#person#;
			</cfoutput>
			<br>
		</cfoutput>
	</cfoutput>
	<hr>
</cfoutput>