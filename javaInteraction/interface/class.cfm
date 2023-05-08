<cfscript>
basicFileAttributesInterface = createObject("java", "java.nio.file.attribute.BasicFileAttributes");

writeDump(basicFileAttributesInterface.class);
</cfscript>