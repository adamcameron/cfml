<cfinclude template="/emptysite/Application.cfm">

<cfset sPath = getDirectoryFromPath(getCurrentTemplatePath())>
<cfset sFile = sPath & "keys.dat">
<cffile action="read" variable="wKeys" file="#sFile#">

<cfwddx action="wddx2cfml" input="#wKeys#" output="stKeys">


<cfset aKeys = listToArray(stKeys.keys)>

<cfdump var="#aKeys#">

<cfset oKeys = createObject("component", "shadomx.services.keys")>

<cfset i =1>
<cfloop index="i" from="1" to="#arrayLen(aKeys)#">
	<cfset stKey = oKeys.decipherKey(key=akeys[i], keyName="emptysite")>
	<cfdump var="#stKey#">
</cfloop>

<cfset oKeyService = application.shado.services.keys>
<cfdump var="#oKeyService.returnKeys()#">