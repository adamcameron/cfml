<cfscript>
	if (structKeyExists(form, "fileToUpload")){
		targetDir = expandPath("./files/"); 
		handler = new Handler();
		handler.uploadFile(upload="fileToUpload", target=targetDir);
		
		files = directoryList(targetDir,false,"query");
		writeDump(files);
	}
</cfscript>
<cfoutput>
	<form action="#CGI.script_name#" method="post" enctype="multipart/form-data">
		<input type="file" name="fileToUpload" />
		<input type="submit" name="btnSUbmit" value="Upload" />
	</form>
</cfoutput>
