<cfquery name="records" dbtype="hql">
	FROM	Scratch
	WHERE	id > 2
</cfquery>	
<cfdump var="#records#">