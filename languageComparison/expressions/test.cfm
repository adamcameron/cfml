<cfscript>
// test.cfm
a = 1;
b = 2;
if (a=b){
	writeOutput("yup");
}else{
	writeOutput("nup");
}
writeOutput("#a# #b#");
</cfscript>