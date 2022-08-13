<cfscript>
LF = chr(10);
system = createObject("java", "java.lang.System");
classPath = system.getProperty("java.class.path");
writeOutput("#LF##LF##classpath##LF##LF#");	
</cfscript>