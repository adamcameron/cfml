<cfscript>
// railoReduceBug.cfm
rainbow	= ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"];
asString = rainbow.reduce(function(reduction="", colour){
	reduction &= colour;
	return reduction;
});
writeDump([rainbow,asString]);
</cfscript>