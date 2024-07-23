<cfscript>
nativeArrayControl = [];
writeOutput("Type: " & nativeArrayControl.getClass().getName() & "<br>");

s = "G'day world";
javaArray = s.getBytes();
writeOutput("Type: " & javaArray.getClass().getName() & "<br>");

nativeArray = [].append(javaArray, true);
writeOutput("Type: " & nativeArray.getClass().getName() & "<br>");
</cfscript>