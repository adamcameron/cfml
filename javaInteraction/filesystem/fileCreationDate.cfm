<cfscript>
dir = expandPath("./");

paths = createObject("java", "java.nio.file.Paths");	
p = paths.get(dir, []);

files = createObject("java", "java.nio.file.Files");

linkOption = createObject("java", "java.nio.file.LinkOption");
linkOptions = linkOption.values();

basicFileAttributeView = createObject("java", "java.nio.file.attribute.BasicFileAttributeView");
basicFileAttributeViewClass=basicFileAttributeView.getClass();

view = files.getFileAttributeView(p, basicFileAttributeViewClass, linkOptions).readAttributes();

writeOutput("#view.creationTime()# is the same as #view.lastModifiedTime()#");
</cfscript>