<cfscript>
a = [];
writeOutput("Elements: #arrayLen(a)#; capcity: #a.capacity()#<br />");

arrayResize(a, 1000);
writeOutput("Elements: #arrayLen(a)#; capcity: #a.capacity()#<br />");
	
</cfscript>