<cfmenu name="menu1" type="vertical">
	<cfloop index="i" from="1" to="15">
		<cfmenuitem href="#cgi.script_name#" name="itm#i#" display="Item #i#" />
	</cfloop>
</cfmenu>