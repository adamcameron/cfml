<cfscript>
// original.cfm
timezoneClass = createObject( "java", "java.util.TimeZone" );
allZones = timezoneClass.getAvailableIds();
writeDump(var=allZones, top=10);

arraySort(allZones, "text");
writeDump(var=allZones, top=10);
</cfscript>