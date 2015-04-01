<cfscript>
// 3750733.cfm
original = "11,23;31:43^53-61";
delims = ",;:^-";

filtered = listFilter(original,function(v){
return reFind("3$", v);
},delims);

writeDump([original,filtered]);

</cfscript>