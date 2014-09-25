<cfscript>
xmlFile = getDirectoryFromPath(getCurrentTemplatePath()) & "\basic.xml";

xml = xmlParse(xmlFile);

writeDump(xml);
</cfscript>