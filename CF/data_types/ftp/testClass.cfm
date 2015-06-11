
<cfftp action="open" server="localhost" stoponerror="yes" username="deploy1" password="deploy1" connection="ftpConn">
<cfoutput>#htmlEditFormat(getMetaData(ftpConn))#</cfoutput>

<cfdump var="#server#">