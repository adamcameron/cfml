<cfscript>
//firstClassAdobeExample.cfm
toUpper = function(v){
	return ucase(v);
};

rainbow	= ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"];
try {
	arrayEach(rainbow, ucase);
	writeDump(rainbow);
}
catch (any e){
	writeDump([e.type,e.message,e.detail]);
}

rainbow	= ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"];
rainbow.each(toUpper);
writeDump(rainbow);

</cfscript>

