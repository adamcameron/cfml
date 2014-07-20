<cfscript>
q = queryNew("col");
writeOutput("<h3>Testing on query column</h3>");
writeOutput("isNull(q.col): #isNull(q.col)#<br>");
wasNullViaOperator = q.col ?: "It was null";
writeOutput("Column ref was null via operator: #wasNullViaOperator#<br>");
writeOutput("q.col.getClass().getName(): #q.col.getClass().getName()#<br>");

writeOutput("<h3>Testing on query cell</h3>");
wasNullViaOperator = q.col[1] ?: "It was null";
writeOutput("Row-referenced column was null via operator: #wasNullViaOperator#<br>");

writeOutput("<h3>Testing on query</h3>");
wasNullViaOperator = q ?: "It was null";
writeOutput("Query was null via operator: #wasNullViaOperator#<br>");
</cfscript>