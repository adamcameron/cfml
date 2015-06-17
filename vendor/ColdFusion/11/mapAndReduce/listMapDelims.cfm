<cfscript>
// listMapDelims.cfm
rainbow	= "Whero|Karaka|Kowhai|Kakariki|Kikorangi|Tawatawa|Mawhero";

externalList = "";
reverseRainbow = listMap(
	rainbow,
	function(v,i,l){
		var newValue = "#i#:#v.reverse()#";
		externalList = externalList.append(newValue);
		return newValue;
	},
	"|",
	true
);
writeDump([rainbow,reverseRainbow,externalList]);
</cfscript>