<cfscript>
// acker.cfm	
areAllNull = isnull(request) && isnull(server) && isnull(form) && isnull(url) && isNull({}) && isnull(33);

writeOutput("
isnull(request): #isnull(request)#<br>
isnull(server): #isnull(server)#<br>
isnull(form): #isnull(form)#<br>
isnull(url): #isnull(url)#<br>
isnull(33): #isnull(33)#<br>
isNull({}): #isNull({})#<br>
areAllNull: #areAllNull#<br>
");
</cfscript>