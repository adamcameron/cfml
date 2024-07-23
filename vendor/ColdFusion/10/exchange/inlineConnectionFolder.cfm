<cfflush interval="16">
<cftry>
	<cfexchangefolder action="getInfo" folderpath="/" name="qFolderInfo" server="webmail.wharton.upenn.edu" protocol="https" username="Cfexchange-v10-test1" password="Chameleon24L:Rugby" serverversion="2010">
	<cfdump var="#qFolderInfo#"> 
		
	<cfcatch>
		<cfdump var="#cfcatch#" label="Exception when opening connection">
	</cfcatch>
</cftry>