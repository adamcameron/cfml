<cfscript>
	basePath = expandPath("./");
	tags = fileRead(basePath & "tags.txt").toArray(chr(10)&chr(13)).each(function(v){
		var tagDir = basePath & v & "/";
		if (!directoryExists(tagDir)){
			directoryCreate(tagDir);
		}
		fileWrite(tagDir & "min.cfm", "");
	});
</cfscript>