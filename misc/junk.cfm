<cfscript>
function nextIds(ids, id, count){
	var thisIdIdx = ids.find(id);
	var nextIds = [];
	for (var i=thisIdIdx+1; i <= ids.len() && nextIds.len() < count; i++){
		nextIds.append(ids[i]);
	}
	return nextIds;
}




function nextIds2(ids, id, count){
	var thisIdIdx = ids.find(id);
	var idsLen = ids.len();
	if (thisIdIdx == 0 || thisIdIdx == idsLen){
		return [];
	}
	return ids.slice(thisIdIdx+1, min(idsLen-thisIdIdx, count));
}


writeDump([result1,result2]);
</cfscript>