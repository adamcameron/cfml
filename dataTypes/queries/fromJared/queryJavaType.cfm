<table>
<tr>
<td valign="top">
&nbsp;
</td>
<td valign="top">
<cfscript>
oClass = createObject("java", "java.lang.Class");
qV = createObject("java", "coldfusion.runtime.QueryVector");
qV.init("test",arrayNew(1));
qV.addColumn("zero");
qV.addColumn("null");
qV.addColumn("abstract");
qV.addColumn("obsolete");
qV.addRows(10);
qry = qV.getQuery();

querySetCell(qry,"null","this is a real row",5);

thisClass = qV.getClass();

while (isDefined("thisClass")){
writeOutput(thisClass.getName() & "<br />");
thisClass = oClass.forName(thisClass.getName()).getSuperClass();
}

writeOutput("<br /><br />");

thisClass = qV.getQuery().getClass();

while (isDefined("thisClass")){
writeOutput(thisClass.getName() & "<br />");
thisClass = oClass.forName(thisClass.getName()).getSuperClass();
}
</cfscript>

<cfdump var="#qry#" />
<cfdump var="#qV#" />
<cfdump var="#qV.getColumnNames()#" />
<cfdump var="#qV.getData(5,2)#" />
</td>
</tr>
</table>