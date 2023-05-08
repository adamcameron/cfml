<cfscript>
cfform(method="post"){
	writeOutput('<br>Integer: ');
	cfinput(name="integerValue", validate="integer");
	writeOutput('<br>Float: ');
	cfinput(name="floatValue", validate="integer");
	writeOutput('<br>');
	cfinput(type="Submit", name="btnSubmit", value="Submit");
}
writeDump(var=form);
</cfscript>