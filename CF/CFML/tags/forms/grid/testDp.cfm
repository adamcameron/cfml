<cfset oDp = createObject("component", "shared.cf.cfml.8.grid.DataProvider")>

<cfset q = oDp.getGridData(page=3, pageSize=5, gridsortcolumn="DOB", gridsortdirection="ASC")>

<cfdump var="#q#">