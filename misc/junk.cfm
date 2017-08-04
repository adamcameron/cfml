<cfscript>
thingArray = [[1,2,3],[4,5,6],[7,8,9]];
arrayeach(thingArray,function(item){
	arrayeach(item,function(subItem) {
		writedump(f);
	});
});
</cfscript>