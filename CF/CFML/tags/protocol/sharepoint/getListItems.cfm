<cfscript>
	xQuery					= xmlNew();
	xQuery.xmlRoot			= xmlElemNew(xQuery, "Query");
	xViewFields				= xmlNew();
	xViewFields.xmlRoot		= xmlElemNew(xViewFields, "ViewFields");
	xQueryOptions			= xmlNew();
	xQueryOptions.xmlRoot	= xmlElemNew(xQueryOptions, "QueryOptions");
	
	stAttributes = {
			action	= "getlistitems",
			params	= {
				listname		= "{F7941704-4293-4976-BA39-AD2CE2BC4090}",
				viewname		= "",
				query			= xQuery,
				viewfields		= xViewFields,
				rowlimit		= 5,
				queryoptions	= xQueryOptions
			},
			login	= application.sharepoint.credentials,
			name	= "qResult"
		}
	;
</cfscript>

<cfsharepoint attributecollection="#stAttributes#" />
<cfdump var="#qResult#">
