<cfscript>
rainbow = [{colour="Whero"},{colour="Karaka"},{colour="Kowhai"},{colour="Kakariki"},{colour="Kikorangi"},{colour="Tawatawa"},{colour="Mawhero"}];

arrayeach(
	rainbow,
	function(v){
		v.colour = ucase(v.colour);
	}
);

writeDump(rainbow);
</cfscript>