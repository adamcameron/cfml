<cfdirectory action="list" listinfo="name" name="qDir" directory="#expandPath('./')#">
<cfdump var="#qDir#">

<cfset qDir = directoryList(expandPath('./'), false, "name")>
<cfdump var="#qDir#">
