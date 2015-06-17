<cfscript>
	stGridArgs						= structNew();
	stGridArgs.name					= "data";
	stGridArgs.format				= "html";
	stGridArgs.pagesize				= 5;
	stGridArgs.width				= 900;
	stGridArgs.striperows			= true;
	stGridArgs.striperowcolor		= "##E0E0E0";
	stGridArgs.bind					= "cfc:shared.cf.cfml.8.grid.DataProvider.getGridData({cfgridpage},{cfgridpagesize},{cfgridsortcolumn},{cfgridsortdirection}})";
	stGridArgs.pageSize				= 5;
	stGridArgs.preservePageOnSort	= true;
</cfscript>

<cfform name="main" width="600">
	<cfgrid attributeCollection="#stGridArgs#">
		<cfgridcolumn name="firstName" header="First Name">
		<cfgridcolumn name="lastName" header="Last Name">
		<cfgridcolumn name="dob" header="Date of Birth" mask="dd/mm/yyyy">
	</cfgrid>
</cfform>