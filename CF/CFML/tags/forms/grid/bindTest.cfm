<cfform>
	<cfgrid format="html" name="grd1" bind="cfc:shared.cf.cfml.G.grid.BindTest.getData({cfgridpage},{cfgridpagesize},{cfgridsortcolumn},{cfgridsortdirection})" bindonload="true" >
		<cfgridcolumn name="name">
		<cfgridcolumn name="colour">
	</cfgrid>
</cfform>