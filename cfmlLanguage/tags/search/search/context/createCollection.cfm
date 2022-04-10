<cfflush interval="128">

<cfparam name="URL.engine">
<cfset sDataDir = expandPath("./files/")>
<cfset sDir = expandPath("./collection/#URL.engine#")>
<cfset sCollection = "primateTest#URL.engine#">
<cfset sUrl = "/shared/cf/cfml/S-Z/context/files/">

<cfif not directoryExists(sDir)>
	<cfdirectory action="create" directory="#sDir#">
</cfif>

<cftry>
	<cfcollection	engine		= "#URL.engine#"
					collection	= "#sCollection#"
					action		= "create"
					path		= "#sDir#"
	>
	<cfcatch>
		<cfdump var="#cfcatch#" label="CFCATCH from CFCOLLECTION">
	</cfcatch>
</cftry>

<cftry>
	<cfindex		action		= "refresh"
					collection	= "#sCollection#"
					type		= "path"
					key			= "#sDataDir#"
					extensions	= ".pdf,.doc"
					recurse		= "true"
					urlpath		= "#sUrl#"
					status 		= "stIndex"
	>
	<cfdump var="#stIndex#" label="stIndex">
	<cfcatch>
		<cfdump var="#cfcatch#" label="CFCATCH from CFINDEX">
	</cfcatch>
</cftry>


<cftry>
<cfsearch collection="#sCollection#" criteria="" name="qSearch" status="stSearch">
<cfdump var="#qSearch#" label="qSearch">
<cfdump var="#stSearch#" label="stSearch">
<cfcatch>
	<cfdump var="#cfcatch#">
</cfcatch>
</cftry>