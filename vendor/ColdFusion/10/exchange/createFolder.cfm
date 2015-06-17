<cfset sFolderName = "Adam Test Folder 2">

<cfflush interval="16">
<cftry>
	<cfinclude template="./credentials.cfm">
	Opening connection&hellip;
	<cfexchangeconnection
		action				= "open" 
		connection			= "exchConn" 
		serverversion		= "2010"
		attributecollection	= "#stCredentials#"
	>
	opened<br />
	
	
	<cfexchangefolder connection="exchConn" action="getInfo" folderpath="/" name="qBaseFolderInfo">
	<cfdump var="#qBaseFolderInfo#">
	
	<cfif qBaseFolderInfo.recordCount>
		Creating folder&hellip;
		<cfset stFolder = {
			displayname	= sFolderName
		}>
		<cfexchangefolder result="stResult" connection="exchConn" folder="#stFolder#" parentfolderid="#qBaseFolderInfo.uid[1]#" action="create">
		created<br />
		<cfdump var="#stResult#">
		Removing folder&hellip;
		<cfexchangefolder connection="exchConn" action="findSubFolders" uid="#qBaseFolderInfo.uid[1]#" name="qDeleteFolderInfo">
			<cfexchangefilter name="displayname" value="#sFolderName#">
		</cfexchangefolder>
		<cfdump var="#qDeleteFolderInfo#" label="Folder to delete">
		<cfif qBaseFolderInfo.recordCount>
			Deleting&hellip;
			<!---<cfexchangefolder connection="exchConn" action="delete" uid="#qDeleteFolderInfo.uid[1]#" deletetype="hardDelete">--->
			deleted<br />
		<cfelse>
			Folder not found, nothing to delete<br />
		</cfif>
		Removed<br />
		Verifying results&hellip;
		<cfexchangefolder connection="exchConn" action="findSubFolders" uid="#qBaseFolderInfo.uid[1]#" name="qOtherFolderInfo">
		<cfdump var="#qOtherFolderInfo#" label="Verify">
		Verified<br />
	<cfelse>
		Test aborted: no parent folder<br />	
	</cfif>
		
	<cfcatch>
		<cfdump var="#cfcatch#" label="Exception when opening connection">
	</cfcatch>
	<cffinally>
		<cftry>
			Closing connection&hellip;
			<cfexchangeconnection action="close" connection="exchConn">
			closed<br />
			<cfcatch>
				<cfdump var="#cfcatch#" label="Exception when closing connection">
			</cfcatch>
		</cftry>	
	</cffinally>
</cftry>