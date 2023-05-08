<cfoutput><form method="post" action="#CGI.script_name#" enctype="multipart/form-data"></cfoutput>
	<input type="file" name="photo" />
	<input type="submit" name="btnSubmit" value="Submit" />
</form>

<cfif structKeyExists(form, "btnSubmit")>
	<cftry>
		<cffile	action		= "upload"
				filefield	= "Form.Photo"
				destination	= "#expandPath('.')#"
				nameconflict= "makeunique"
				result		= "Thumb"
				accept		= "image/*"
		>
		<cfcatch>
			<cfdump var="#cfcatch#">
		</cfcatch>
	</cftry>
</cfif>
	