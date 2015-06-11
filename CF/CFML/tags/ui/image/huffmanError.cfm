<cfimage action="read" source="C:\webroots\shared\cf\cfml\image\68820ECB-D47C-3134-F8FE382CB080C2DC.jpg" name="myImage">
<cfset newImageName = "#getDirectoryFromPath(getCurrentTemplatePath())##createUUID()#.jpg"/>
<cfimage action="write" destination="#newImageName#" source="#myImage#">

