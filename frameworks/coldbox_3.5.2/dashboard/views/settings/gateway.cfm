<cfoutput>
<script language="javascript">
$(document).ready(function() {
 	//Load System Info
	doEvent('#Event.getValue("xehSettings")#', 'content', {});
});
</script>
<!--- Rollovers --->
#renderView("tags/rollovers")#

<!--- Title Bar --->
<div class="sidemenu_title">
    <div class="sidemenu_title_img"  ><img src="includes/images/icons/settings_27.gif"></div>
	<div class="sidemenu_title_text" >Settings</div>
</div>

<!--- Sub Menu Links --->
<ul>
	<li><a href="javascript:doEvent('#Event.getValue("xehSettings")#', 'content', {})" onMouseOver="getHint('overview')" onMouseOut="resetHint()">Settings Overview</a></li>

	<li><a href="javascript:doEvent('#Event.getValue("xehGeneralSettings")#', 'content', {})" onMouseOver="getHint('generalsettings')" onMouseOut="resetHint()">General Settings</a></li>

	<li><a href="javascript:doEvent('#Event.getValue("xehCacheSettings")#', 'content', {})" onMouseOver="getHint('cachesettings')" onMouseOut="resetHint()">Cache Settings</a></li>

	<li><a href="javascript:doEvent('#Event.getValue("xehDebuggerSettings")#', 'content', {})" onMouseOver="getHint('debuggersettings')" onMouseOut="resetHint()">Debugger Settings</a></li>

	<li><a href="javascript:doEvent('#Event.getValue("xehConventions")#', 'content', {})" onMouseOver="getHint('conventions')" onMouseOut="resetHint()">Framework Conventions</a></li>
	
	<li><a href="javascript:doEvent('#Event.getValue("xehPassword")#', 'content', {})" onMouseOver="getHint('passwordsettings')" onMouseOut="resetHint()">Change Dashboard Password</a></li>
		
</ul>

</cfoutput>