<cfoutput>
<!--- Content Ajax JS --->
<cfsavecontent variable="js">
<script language="javascript">
$(document).ready(function() {
 	//Load System Info
	doEvent('#Event.getValue("xehSystemInfo")#', 'content', {});
});
</script>
</cfsavecontent>
<cfhtmlhead text="#js#">

<!--- Roll Over Tags --->
#renderView("tags/rollovers")#

<!--- Title Bar --->
<div class="sidemenu_title">
    <div class="sidemenu_title_img"  ><img src="includes/images/icons/home_27.gif"></div>
	<div class="sidemenu_title_text" >Home</div>
</div>

<!--- Sub Menu Links --->
<ul>
	<li><a href="javascript:doEvent('#Event.getValue("xehSystemInfo")#', 'content', {})" onMouseOver="getHint('sysinfo')" onMouseOut="resetHint()">System Information</a></li>

	<li><a href="javascript:doEvent('#Event.getValue("xehResources")#', 'content', {})" onMouseOver="getHint('onlineresources')" onMouseOut="resetHint()">Online Resources</a></li>

	<cfif controller.getCFMLEngine().isComponentData() or controller.getCFMLEngine().getEngine() eq "ADOBE">
		<li><a href="javascript:doEvent('#Event.getValue("xehCFCDocs")#', 'content', {})" onMouseOver="getHint('cfcdocs')" onMouseOut="resetHint()">CFC API Documentation</a></li>
	</cfif>
</ul>
</cfoutput>