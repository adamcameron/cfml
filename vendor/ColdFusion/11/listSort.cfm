<cfscript>
rainbow	= "whero,karaka,kowhai,kakariki,kikorangi,tawatawa,mawhero";
result = listSort(rainbow, function(e1,e2){
	return sgn(e1.len() - e2.len());
});
writeOutput("sorted colours: #result#<br>");
</cfscript>