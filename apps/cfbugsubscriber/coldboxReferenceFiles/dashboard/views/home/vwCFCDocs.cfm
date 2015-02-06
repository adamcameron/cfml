<cfoutput>
<!--- HELPBOX --->
#renderView("tags/help")#

<!--- Placed under content div --->
<div class="maincontentbox">

	<div class="contentboxes_header">
		<div class="contentboxes_title"><img src="includes/images/icons/cfcapi_icon.gif" align="absbottom" />&nbsp; CFC API Documentation</div>
	</div>

	<div class="contentboxes">
	This is your current ColdBox Framework CFC Documentation.<br><br>

	<!--- Render Simple CFC Viewer API --->
	#Event.getValue("CFCViewer").renderit()#
	
	</div>

</div>
</cfoutput>