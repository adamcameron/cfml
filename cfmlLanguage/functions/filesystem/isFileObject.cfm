<cfscript>
fh = fileOpen(getCurrentTemplatePath());
writeOutput(isFileObject(fh));
fc = fileRead(getCurrentTemplatePath());
writeOutput(isFileObject(fc));
</cfscript>