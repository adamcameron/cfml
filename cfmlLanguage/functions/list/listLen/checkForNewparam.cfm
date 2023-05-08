<cfset l = "one,,three,,five,,seven,,nine,,">
<cfoutput>
listAppend("#l#", "twelve"): [#listAppend(l, "twelve")#]<br />
<!---listAppend("#l#", "twelve", ",", true): [#listAppend(l, "twelve", ",", true)#]<br />--->
<hr />
listChangeDelims("#l#", "|"): [#listChangeDelims(l, "|")#]<br />
listChangeDelims("#l#", "|", ",", true): [#listChangeDelims(l, "|", ",", true)#]<br />
<hr />
listContains("#l#", "five"): [#listContains(l, "five")#]<br />
listContains("#l#", "five", ",", true): [#listContains(l, "five", ",", true)#]<br />
<hr />
listContainsNoCase("#l#", "five"): [#listContainsNoCase(l, "five")#]<br />
listContainsNoCase("#l#", "five", ",", true): [#listContainsNoCase(l, "five", ",", true)#]<br />
<hr />
listDeleteAt("#l#", 5): [#listDeleteAt(l, 5)#]<br />
listDeleteAt("#l#", 5, ",", true): [#listDeleteAt(l, 5, ",", true)#]<br />
<hr />
listFind("#l#", "five"): [#listFind(l, "five")#]<br />
listFind("#l#", "five", ",", true): [#listFind(l, "five", ",", true)#]<br />
<hr />
listFindNoCase("#l#", "five"): [#listFindNoCase(l, "five")#]<br />
listFindNoCase("#l#", "five", ",", true): [#listFindNoCase(l, "five", ",", true)#]<br />
<hr />
<cfset l2 = "," & l>
listFirst("#l2#"): [#listFirst(l2)#]<br />
listFirst("#l2#", ",", true): [#listFirst(l2, ",", true)#]<br />
<hr />
listGetAt("#l#", 5): [#listGetAt(l, 5)#]<br />
listGetAt("#l#", 5, ",", true): [#listGetAt(l, 5, ",", true)#]<br />
<hr />
listInsertAt("#l#", 5, "NEW"): [#listInsertAt(l, 5, "NEW")#]<br />
listInsertAt("#l#", 5, "NEW", ",", true): [#listInsertAt(l, 5, "NEW", ",", true)#]<br />
<hr />
listLast("#l#"): [#listLast(l)#]<br />
listLast("#l#", ",", true): [#listLast(l, ",", true)#]<br />
<hr />
listLen("#l#"): [#listLen(l)#]<br />
listLen("#l#", ",", true): [#listLen(l, ",", true)#]<br />
<hr />
listPrepend("#l#", "zero"): [#listPrepend(l, "zero")#]<br />
<!---listPrepend("#l#", "zero", ",", true): [#listPrepend(l, "zero", ",", true)#]<br />--->
<hr />
listQualify("#l#", "|"): [#listQualify(l, "|")#]<br />
listQualify("#l#", "|", ",", "all", true): [#listQualify(l, "|", ",", "all", true)#]<br />
<hr />
listRest("#l2#"): [#listRest(l2)#]<br />
listRest("#l2#", ",", true): [#listRest(l2, ",", true)#]<br />
<hr />
listSetAt("#l#", 5, "cinq"): [#listSetAt(l, 5, "cinq")#]<br />
<cftry>
listSetAt("#l#", 5, "cinq", ",", true): [#listSetAt(l, 5, "cinq", ",", true)#]<br />
<cfcatch>
<cfdump var="#cfcatch#">
]<br />
</cfcatch>
</cftry>
<hr />
listSort("#l#", "text"): [#listSort(l, "text")#]<br />
listSort("#l#", "text", "asc", ",", true): [#listSort(l, "text", "asc", ",", true)#]<br />
<hr />
listToArray("#l#"): <cfdump var="#listToArray(l)#"><br />
listToArray("#l#", ",", true): <cfdump var="#listToArray(l, ",", true)#"><br />
<hr />
 Should not be affected 
listValueCount("#l#", "five"): [#listValueCount(l, "five")#]<br />
<!---listValueCount("#l#", "five", ",", true): [#listValueCount(l, "five", ",", true)#]<br />--->
<hr />
 Should not be affected 
listValueCountNoCase("#l#", "five"): [#listValueCountNoCase(l, "five")#]<br />
<!---listValueCountNoCase("#l#", "five", ",", true): [#listValueCountNoCase(l, "five", ",", true)#]<br />--->
<hr />

</cfoutput>
