<cfset l1 = "C:\webroots\beta\test_tree\fms/72/0E/A2/3F/C1/CB/76/10/F7/8E/35/93/4B/F5/EB/1E/FA04942C-A7E9-03E7-9155-5FB391F013EC/">
<cfset l2 = listDeleteAt(l1, listLen(l1, "\/"), "\/")>

<cfdump var="#variables#">