<cfscript>
// listMap.cfm
rainbow	= "Whero,Karaka,Kowhai,Kakariki,Kikorangi,Tawatawa,Mawhero";

externalList = "";
reverseRainbow = listMap(rainbow,function(v,i,l){
	var newValue = "#i#:#v.reverse()#";
	externalList = externalList.append(newValue);
	return newValue;
});
writeDump([{rainbow=rainbow},{reverseRainbow=reverseRainbow},{externalList=externalList}]);

externalList = "";
reverseRainbow = rainbow.map(function(v,i,l){
	var newValue = "#i#:#v.reverse()#";
	externalList = externalList.append(newValue);
	return newValue;
});
writeDump([{rainbow=rainbow},{reverseRainbow=reverseRainbow},{externalList=externalList}]);
</cfscript>