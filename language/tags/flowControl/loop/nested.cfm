<cfscript>
selectContent = queryNew("h2,id,content", "varchar,integer,varchar", [
	["one", 1, "content.1"],
	["two", 2, "content.2"],
	["three", 3, "content.3"],
	["four", 4, "content.4"],
	["five", 5, "content.5"],
	["six", 6, "content.6"],
	["seven", 7, "content.7"]
]);

selectPricing = queryNew("groupCol,description,price", "varchar,varchar,varchar", [
	["groupCol.1", "description.1", "1.11"],
	["groupCol.2", "description.2", "2.22"],
	["groupCol.2", "description.3", "3.33"],
	["groupCol.3", "description.4", "4.44"],
	["groupCol.3", "description.5", "5.55"],
	["groupCol.3", "description.6", "6.66"]
]);

</cfscript>
<cfoutput>
<cfloop query="selectContent">
	<section>
		#selectContent.h2#
		<cfif selectContent.id eq 3>
			<cfloop query="selectPricing" group="groupCol">
				<table class="pricing">
				<thead>
					<tr>
						<th>#description#</th>
						<th>Price</th>
					</tr>
				</thead>
				<tbody>
					<cfloop>
					<tr>
						<td>#description#</td>
						<td>#price#</td>
					</tr>
					</cfloop>
				</tbody>
				</table>
			</cfloop>
		</cfif>
		#selectContent.content#
	</section>
</cfloop>
</cfoutput>