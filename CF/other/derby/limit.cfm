<cfset oQuery = new Query(
	sql = "
		SELECT * FROM (
		   SELECT 
		     ROW_NUMBER() OVER () AS R, 
		     T.* 
		   FROM APP.CGLOBAL as T
		) AS TR 
		WHERE R <= 10
	",
	datasource = "clientvars"
).execute()>
<cfdump var="#oQuery#">
