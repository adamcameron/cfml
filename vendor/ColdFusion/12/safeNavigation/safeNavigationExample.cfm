<cfscript>
// safeNavigationExample.cfm
function getMaoriNumberById(id){
	var numbers = ["tahi", "rua", "toru", "wha"];
	if (id <= numbers.len()){
		return numbers[id];
	}
}

//fiveInMaoriInUpperCase = getMaoriNumberById(5).ucase();

fiveInMaori = getMaoriNumberById(5);
if (!isNull(fiveInMaori)){
fiveInMaoriInUpperCase = fiveInMaori.ucase();
}else{
	fiveInMaoriInUpperCase = javaCast("null", "");
}


</cfscript>