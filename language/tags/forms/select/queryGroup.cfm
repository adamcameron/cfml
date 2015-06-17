<cfscript>
	q = queryNew("id,type,element");
	stData = {
		Person	= ["Adam", "Belinda", "Charlie", "Donna", "Eric", "Fleur"],
		Colour	= ["Red", "Green", "Blue", "Black", "White"],
		Animal	= ["ocelot", "marmoset", "pangolin", "wombat"]
	};
	iRow = 0;
	for (sKey in stData){
		for (i=1; i < arrayLen(stData[sKey]); i++){
			queryAddRow(q);
			querySetCell(q, "id", ++iRow);
			querySetCell(q, "type", sKey);
			querySetCell(q, "element", stData[sKey][i]);
		}
	}
</cfscript>

<cfparam name="form.s" default="">

<cfform>
	<cfselect name="s" query="q" group="type" display="element" value="id" selected="#form.s#" />
	<cfinput type="submit" name="btnSubmit" value="Submit" />
</cfform>

<cfif structKeyExists(form, "fieldNames")>
	<cfdump var="#form#" format="text">
</cfif>
