<cfoutput>
<script language="javascript">
$(document).ready(function() {
 	//Load System Info
	doEvent('#Event.getValue("xehGenerator")#', 'content', {});
});
</script>

<!--- Rollovers --->
#renderView("tags/rollovers")#

<!--- Title Bar --->
<div class="sidemenu_title">
    <div class="sidemenu_title_img"  ><img src="includes/images/icons/tools_27.gif"></div>
	<div class="sidemenu_title_text" >Tools</div>
</div>

<!--- Sub Menu Links --->
<ul>
	<li><a href="javascript:doEvent('#Event.getValue("xehGenerator")#', 'content', {})" onMouseOver="getHint('generator')" onMouseOut="resetHint()">Application Generator</a></li>
</ul>

</cfoutput>