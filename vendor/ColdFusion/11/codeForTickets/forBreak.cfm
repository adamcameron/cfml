<cfscript>
// forBreak.cfm
week = ["Rāhina", "Rātū", "Rāapa", "Rāpare", "Rāmere", "Rāhoroi", "Rātapu"];

f = function(v,i){
	if (i > 3){
		break;
	}
	writeOutput(v & "<br>");
};

for (i=1; i <= week.len(); i++){
	f(week[i],i);
}

i=0;
for (v in week){
	f(v,++i);
}

</cfscript>