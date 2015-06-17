<cfset stGrid = {
	name		= "grid1"
	,bindonload	= "true"
	,format		= "html"
	,selectmode	= "edit"
	,bind		= "cfc:FormGrid.get({cfgridpage},{cfgridpagesize},{cfgridsortcolumn},{cfgridsortdirection})"
	,onchange	= "cfc:FormGrid.change({cfgridaction},{cfgridrow},{cfgridchanged})"
}>

<cfform>
	<cfgrid attributeCollection="#stGrid#">
		<cfgridcolumn name="id">
		<cfgridcolumn name="name">
		<cfgridcolumn name="active" type="boolean">
	</cfgrid>
</cfform>