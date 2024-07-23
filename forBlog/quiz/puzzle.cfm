<cfscript>
	boolean function isWithinWebroot(required string fileSystemPath){
	 	var dirCurrent = createObject("java", "java.io.File").init(fileSystemPath).getCanonicalPath();
		var dirBase = createObject("java", "java.io.File").init(expandPath("/")).getCanonicalPath();

		return findNoCase(dirBase, dirCurrent) && directoryExists(dirCurrent);
	}

	paths = [
		"D:\websites\www.scribble.local\java\",
		"D:\websites\www.scribble.local\java",
		"D:\websites\www.scribble.local\js\..\java\",
		"D:\websites\www.scribble.local\cf\scopes\session\..\..\misc\bracesWeirdness\..\..\..\java\",
		"D:/websites/www.scribble.local/java/",
		"D:/websites/www.scribble.local/java",
		"D:/websites/www.scribble.local/js/../java/",
		"D:/websites/www.scribble.local/cf/scopes/session/../../misc/bracesWeirdness/../../../java/",
		"D:\websites\www.scribble.local\java\..\",
		"D:\websites\www.scribble.local\java\..\..",
		"D:\websites\www.scribble.local\java\..\../"
	];

	for (path in paths){
		writeOutput(path &"<br>");
		writeOutput(createObject("java", "java.io.File").init(path).getCanonicalPath() &"<br>");
		writeOutput(isWithinWebroot(path) &"<br>");
		writeOutput("<hr>");
	}


</cfscript>