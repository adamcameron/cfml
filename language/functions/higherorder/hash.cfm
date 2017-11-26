<cfscript>
try {
	s = "letmein123";
	h = s.hash();
	writeDump({s=s, h=h});
} catch(any e){
	writeDump([e.message]);
}
</cfscript>