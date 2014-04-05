<cfscript>
theDir = expandPath("/com/daccf/cfmlnotifier/");
theFile = theDir & "AdobeBugService.dat";
writeDump([theDir,theFile,fileExists(theFile)]);
</cfscript>