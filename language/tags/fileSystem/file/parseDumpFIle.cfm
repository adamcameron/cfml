<cfflush interval="512">
<cfscript>
	oCfml = createObject("component", "shadomx.util.cfml");
	iBuf	= 1024*1024;
//	sFile	= "C:\temp\arup\ecmlive.dmp";
	sFile	= "C:\temp\arup\arup.dmp";
	
	i		= 1;
	
	f = fileOpen(sFile, "read", "UTF-8");

	while(not FileIsEOF(f)){
		// i++;
		s = fileRead(f, iBuf);
		a = REMatchNoCase('create table ".*?tablespace "[^"]+"', s);
		if (arrayLen(a)){
			oCfml.cfDump(a);
		}
		// if (i gt 500) break;
	}
</cfscript>

<!--- 

</cfscript>
<cfdump var="#s#">

<cfabort>
<cfscript>

 --->