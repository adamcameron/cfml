<cfscript>
rainbow					= ["Whero","Karaka","Kowhai","Kakariki","Kikorangi","Tawatawa","Mawhero"];
serialisedViaFunction	= serialize(rainbow);
deserialised			= evaluate(serialisedViaFunction);

writeDump([rainbow,serialisedViaFunction,deserialised]);  
</cfscript>