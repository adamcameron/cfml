<cfscript>
original = "whero,karaka,kowhai,kakariki,kikorangi,poropango,papura";
toReplace = "WHERO,KARAKA,KOWHAI,KAKARIKI,KIKORANGI,POROPANGO,PAPURA";
with = "red,orange,yellow,green,blue,indigo,violet";
expected = with;

result = original.replaceListNoCase(toReplace, with);
comparison = compare(expected,result);
writeDump(variables);
</cfscript>