<cfscript>
// arrayMap.cfm
rainbow	= ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"];
colourInList = arrayMap(
	rainbow,
		function(v,i,a){
		return replace(a.toList(), v, ucase(v));
	}
);
writeDump([rainbow,colourInList]);


rainbow.map(function(v,i,a){
	return replace(a.toList(), v, ucase(v));
});
writeDump([rainbow,colourInList]);
</cfscript>