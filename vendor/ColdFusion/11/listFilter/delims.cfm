<cfscript>
original = "11,23;31:43^53-61";
delims = ",;:^-";

filtered = listFilter(original,function(v){
	return reFind("3$", v);
},delims);

//writeDump([original,filtered]);

viaDeletions = listDeleteAt(original, listFind(original, 11, delims), delims);
viaDeletions = listDeleteAt(viaDeletions, listFind(viaDeletions, 31, delims), delims);
viaDeletions = listDeleteAt(viaDeletions, listFind(viaDeletions, 61, delims), delims);

writeDump([original,viaDeletions]);
</cfscript>