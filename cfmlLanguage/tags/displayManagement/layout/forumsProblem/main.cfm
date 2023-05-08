<cfajaximport tags="cfform,cfmenu">
<cflayout type="vbox" align="center">
    <cflayoutarea name="menu">
    <cfmenu type="horizontal">
        <cfmenuitem display="Index" href="javascript:ColdFusion.navigate('./menu_index.cfm','mainArea')"></cfmenuitem>
        <cfmenuitem display="Tickets">
            <cfmenuitem name="open" display="View Open Tickets" href="javaScript:ColdFusion.navigate('menu_ticket.cfm','mainArea')"  />
            <cfmenuitem name="Search" display="Search Old Tickets" href="menu_search.cfm" target="mainArea" />           
        </cfmenuitem>
    </cfmenu>
    </cflayoutarea>
    <cflayoutarea name="mainArea">
		Default content
     </cflayoutarea>

</cflayout>