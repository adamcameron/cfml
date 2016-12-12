<form action="./cv.cfm" method="post" enctype="multipart/form-data">
	<input type="text" name="myName">
	<input type="file" name="myFile">
	<input type="submit" name="btnSubmit" value="Go">
</form>


<cfscript>
if (form.keyExists("btnSubmit")) {
	writeOutput(
		"<pre>" 
		& createObject("java", "me.adamcameron.miscellany.ClassViewer").viewObject(form)
		& "</pre>"
	);
	writeDump(form);
	writeDump(form.getPartsArray());
}
</cfscript>