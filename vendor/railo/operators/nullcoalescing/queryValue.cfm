
<cfscript>
writeOutput("<h3>Empty query</h3>");
q = queryNew("col");
writeOutput("isNull(q.col): #isNull(q.col)#<br>");
writeOutput("q.col.getClass().getName(): #q.col.getClass().getName()#<br>");
wasNullViaOperator = q.col ?: "It was null";
writeOutput("Was null via operator: #wasNullViaOperator#<br>");

writeOutput("isNull(q.col[1]): #isNull(q.col[1])#<br>");
wasNullViaOperator = q.col[1] ?: "It was null";
writeOutput("Was null via operator: #wasNullViaOperator#<br>");
writeOutput("<hr>");

writeOutput("<h3>One row query will null value</h3>");
q = queryNew("col");
queryAddRow(q);
writeOutput("isNull(q.col): #isNull(q.col)#<br>");
wasNullViaOperator = q.col ?: "It was null";
writeOutput("Was null via operator: #wasNullViaOperator#<br>");

writeOutput("isNull(q.col[1]): #isNull(q.col[1])#<br>");
wasNullViaOperator = q.col[1] ?: "It was null";
writeOutput("Was null via operator: #wasNullViaOperator#<br>");
writeOutput("<hr>");

writeOutput("<h3>Multiple row query will null value</h3>");
q = queryNew("col");
queryAddRow(q, 2);
writeOutput("isNull(q.col[2]): #isNull(q.col[2])#<br>");
wasNullViaOperator = q.col[2] ?: "It was null";
writeOutput("Was null via operator: #wasNullViaOperator#<br>");
writeOutput("<hr>");

writeOutput("<h3>Multiple row query will null value in one column</h3>");
q = queryNew("id,col");
queryAddRow(q, 2);
q.id[1] = 1;
q.id[2] = 2;
writeOutput("isNull(q.col[2]): #isNull(q.col[2])#<br>");
wasNullViaOperator = q.col[2] ?: "It was null";
writeOutput("Was null via operator: #wasNullViaOperator#<br>");
writeOutput("<hr>");
</cfscript>