<cfajaximport tags="cfwindow">
<h3>Main page input:</h3>
<cfoutput>#url.text#</cfoutput><br />
<cfoutput>#timeFormat(now(), 'HH:MM:SS.LLL')#</cfoutput><br />

<cfif structKeyExists(URL, "windowname")>
<br /><cfoutput><a href="##" onclick="javascript:ColdFusion.Window.destroy('#URL.windowname#');">Close</a></cfoutput>

</cfif>
