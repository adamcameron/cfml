<cfzip action="read" file="#expandPath('4_2/testWindows.zip')#" entrypath="server-railo.png" variable="zip">

<cfdump var="#zip#">