<cfquery datasource="cfartgallery" name="data">
	SELECT artname
	FROM art
	ORDER BY artname
</cfquery>

<!--- The form --->
<cfform>
Art:
<!--- Populate auto-suggest control --->
<cfinput type="text" name="artname" autosuggest="#ValueList(data.artname)#">
</cfform>