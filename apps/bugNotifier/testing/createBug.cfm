<cfscript>
	param name="form.adobeId" default="";

	if (structKeyExists(form, "btnSubmit")){
		newBug = new Bug();
		newBug.setAdobeId(form.adobeId);
		try {
			entitySave(newBug);
		}
		catch ("InvalidBugException" e){
			variables.message = e.detail;
		}
		catch (any e){
			variables.message = "An unexpected error occurred when adding the bug: #e.message#";
		}
	}
	param name="variables.message" default="";
</cfscript>
<cfoutput>
<cfif len(message)>
	#variables.message#<br /><br />
</cfif>
<form method="post" action="#CGI.script_name#">
	<table>
		<tr>
			<td>Adobe Bug ID:</td>
			<td><input type="text" name="adobeId" vaule="#form.adobeId#" /></td>
		</tr>
		<tr>
			<td colspan="3" align="right">
				<input type="submit" name="btnSubmit" vaule="Submit" />
			</td>
		</tr>
	</table>

</form>
</cfoutput>