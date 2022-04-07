<cfflush interval="16">
<cfparam name="URL.dropfirst" default="false" type="boolean">

<cfif URL.dropFirst>
	<cf_timeit>
	<cftry>
		Deleting collection <cfoutput>#request.collection#</cfoutput>&hellip;
		<cfcollection action="delete" collection="#request.collection#">
		deleted<br />
		<cfcatch>
			error deleting collection: <cfoutput>[#cfcatch.message#][#cfcatch.detail#]</cfoutput><br />
		</cfcatch>
	</cftry>
	</cf_timeit>

	<cf_timeit>
	<cftry>
		<cfset sCollectionDir = expandPath("./") & "collections/" & replace(server.coldfusion.productName, " ", "", "ALL") & "/">
		Creating collection <cfoutput>#request.collection#</cfoutput>&hellip;
		<cfcollection action="create" collection="#request.collection#" path="#sCollectionDir#">
		created<br/>
		<cfcatch>
			error creating collection: <cfoutput>[#cfcatch.message#][#cfcatch.detail#]</cfoutput><br />
		</cfcatch>
	</cftry>
	</cf_timeit>
</cfif>

<cf_timeit>
	<cfset sUrl = "http://" & CGI.SERVER_NAME>
	<cfif CGI.SERVER_PORT neq "80">
		<cfset sUrl = sUrl & ":#CGI.SERVER_PORT#">
	</cfif>
	<cfset sUrl = sUrl & "/shared/cf/cfml/I/index/compareCFandBD/files">
	<cftry>
		Indexing collection <cfoutput>#request.collection#</cfoutput>&hellip;
		<cfindex	collection	= "#request.collection#"
					action		= "refresh"
					type		= "path"
					key			= "#expandpath('./files')#"
					urlpath		= "#sUrl#"
					extensions	= ".pdf"
		>
		indexed<br />
		<cfcatch>
			error indexing collection: <cfoutput>[#cfcatch.message#][#cfcatch.detail#]</cfoutput><br />
		</cfcatch>
	</cftry>
</cf_timeit>