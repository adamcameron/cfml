<cfset testString = "zsdaiogfyoasdghasdhgklanhglkafhgahkhdglkjajghjkaohvdengfnaiosdhgozdfjklgnsdlkghd">
<cfset testList = REReplace(testString, "(.)", "\1#chr(7)#", "ALL")>
<cfset sortList = listSort(testList, "TEXT", "ASC", chr(7))>
<cfset sortString = replace(sortList, chr(7), "", "ALL")>
<cfset deDupe = REReplace(sortString, "(.)\1*", "\1", "ALL")>
<cfdump var="#variables#">