<cfset timezoneClass = createObject( "java", "java.util.TimeZone" ) />
<cfset allZones = timezoneClass.getAvailableIds() />

<!--- <cfset allZonesAsArrayList = createObject("java", "java.util.Arrays").asList(allZones)>
<cfset ArraySort(allZonesAsArrayList, "text") />
<cfdump var="#allZonesAsArrayList#">
 --->
<cfset createObject("java", "java.util.Arrays").sort(allZones)>
<cfdump var="#allZones#" />
