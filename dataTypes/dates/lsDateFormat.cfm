<!--- lsDateFormat.cfm --->
<cfoutput>
#server.coldfusion.productVersion#<br>
#GetLocale()#<br>
<cftry>
	#lsdateformat("29-October-2013")#<br>
	<cfcatch>#cfcatch.message#</cfcatch>
</cftry>
</cfoutput>