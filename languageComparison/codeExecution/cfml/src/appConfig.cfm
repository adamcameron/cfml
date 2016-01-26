<cfscript>
writeOutput("#getCurrentTemplatePath()# loaded<br>");

param application.PROJECT_ROOT = expandPath("../");
param application.DEPENDENCY_DIR = application.PROJECT_ROOT & "other";
</cfscript>