<cfxml variable="xQuery" casesensitive="true">
	<Query>
		<!--<Where>
			<And>
			<Lt>
				<FieldRef Name="ID" />
				<Value Type="Counter">3</Value>
			</Lt>
			<Eq>
				<FieldRef Name="FileLeafRef" />
				<Value Type="Text">tube.pdf</Value>
			</Eq>
			</And>
		</Where>-->
	</Query>
</cfxml>
<cfxml variable="xViewFields" casesensitive="true">
	<ViewFields>
		<FieldRef Name="ID" />
		<FieldRef Name="Title" />
		<FieldRef Name="Modified" />
		<FieldRef Name="ServerUrl" />
		<FieldRef Name="FSObjType" />
	</ViewFields>
</cfxml>
<cfxml variable="xQueryOptions" casesensitive="true">
	<QueryOptions>
		<DateInUtc>TRUE</DateInUtc>
	</QueryOptions>
</cfxml>

<cfscript>
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
