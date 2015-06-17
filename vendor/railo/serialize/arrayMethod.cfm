<cfscript>
	rainbow					= ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"];
	serialisedViaMethod		= rainbow.serialize();
	deserialised			= evaluate(serialisedViaMethod);

	writeDump([rainbow,serialisedViaMethod,deserialised]);  
</cfscript>