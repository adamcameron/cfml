<cfscript>
//structSortEncoding.cfm
pageEncoding="utf-8";

setLocale("German (Standard)");
testStruct = {tt={sortKey="tta"}, Eszett={sortKey="ßa"}, lc={sortKey="ssc"}, rr={sortKey="rra"}, uc={sortKey="SSb"}};
result = structSort(testStruct, "TEXTNOCASE","ASC", "sortKey", false);
writeDump(variables);

testStruct = {tt="tta", Eszett="ßa", lc="ssc", rr="rra", uc="SSb"};
result = structSort(testStruct, "TEXTNOCASE","ASC", "",false);
writeDump(variables);
</cfscript>