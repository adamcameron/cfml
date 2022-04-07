<cfset s = ",this,is,a,list">
<cfset s2 = listAppend(s, "added")>
<cfset s3 = listDeleteAt(s, 4)>
<cfdump var="#variables#">