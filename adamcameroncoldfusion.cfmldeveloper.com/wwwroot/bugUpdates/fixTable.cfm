<cfquery>
	ALTER TABLE adobeBug MODIFY title VARCHAR(8000)
</cfquery>
Title updated<br>
<cfdbinfo datasource="bugUpdates" name="tables" type="columns" table="adobeBug">
<cfdump var="#variables#">