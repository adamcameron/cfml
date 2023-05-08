<!--- bug.cfm --->
<form method="get">
	<input type="submit" name="btnSubmit" value="Submit">
</form>
<cfscript>
if (structKeyExists(form, "btnSubmit")){
	writeDump(var=form, label="form scope received by CF");

	copy = structCopy(form);
	copy.newkey		= "new key/value added to copy";
	copy.btnSubmit = "value changed in copy";
	writeDump(var=copy, label="copy");

	writeDump(var=form, label="form scope after copy taken and copy is adjusted");
}

if (structKeyExists(url, "btnSubmit")){
	writeDump(var=url, label="url scope received by CF");

	copy = structCopy(url);
	copy.newkey		= "new key/value added to copy";
	copy.btnSubmit = "value changed in copy";
	writeDump(var=copy, label="copy");

	writeDump(var=url, label="url scope after copy taken and copy is adjusted");
}
</cfscript>