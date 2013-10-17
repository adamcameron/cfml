<cfimage action="read" source="c:\temp\20090201-1601-with-exif-gps.jpeg" name="img">
<cfset exifTags = ImageGetEXIFMetaData(img)>
<cfset latlng = SexagesimalToDecimalOld(
	exifTags["GPS Latitude"],
	exifTags["GPS Latitude Ref"],
	exifTags["GPS Longitude"],
	exifTags[ "GPS Longitude Ref" ]
) />
<cfset coordinates = SexagesimalToDecimal(
	exifTags["GPS Latitude"],
	exifTags["GPS Latitude Ref"],
	exifTags["GPS Longitude"],
	exifTags[ "GPS Longitude Ref" ]
) />
<cfdump var="#variables#">


<!--- SexagesimalToDecimal --->
<cffunction name="SexagesimalToDecimalOld" output="false" access="public" returntype="any"
	displayname="Sexagesimal To Decimal" hint="I convert Sexagesimal lat/lng coordinates to a Decimal lat/lng pair."
	description="I convert Sexagesimal lat/lng coordinates to a Decimal lat/lng pair.">

	<cfargument name="latitude" type="string" required="true"
    	hint="I am the latitude. I am requried." />
    <cfargument name="latitudeRef" type="string" required="true"
    	hint="I am the latitude Refrence ie:N,S. I am requried." />
    <cfargument name="longitude" type="string" required="true"
    	hint="I am the longitude. I am requried." />
    <cfargument name="longitudeRef" type="string" required="true"
    	hint="I am the longitude Refrence ie:E,W. I am requried." />

	<cfset var latitudeParts = listToArray(arguments.latitude,"'""" ) />

	<cfset var lat = (
		latitudeParts[ 1 ] +
		(latitudeParts[ 2 ] / 60) +
		(latitudeParts[ 3 ] / 3600)
		) />

	<cfif arguments.latitudeRef eq "S">
		<cfset lat *= -1 />
	</cfif>

	<cfset var longitudeParts = listToArray(arguments.longitude,"'""") />

	<cfset var lng = (
		longitudeParts[ 1 ] +
		(longitudeParts[ 2 ] / 60) +
		(longitudeParts[ 3 ] / 3600)
		) />

	<cfif arguments.longitudeRef eq "W">
		<cfset lng *= -1 />
	</cfif>

	<cfreturn lat & "," & lng />
</cffunction>

<cfscript>
function sexagesimalToDecimal(latitude, latitudeRef, longitude, longitudeRef){
	var coordinates = {};
	var latitudeParts = listToArray(arguments.latitude, "'""");
	coordinates.latitude = (
		latitudeParts[1] +
		(latitudeParts[2] / 60) +
		(latitudeParts[3] / 3600)
	);
	if (arguments.latitudeRef == "S"){
		coordinates.latitude *= -1;
	}

	var longitudeParts = listToArray(arguments.longitude,"'""");
	coordinates.longitude = (
		longitudeParts[1] +
		(longitudeParts[2] / 60) +
		(longitudeParts[3] / 3600)
	);
	if (arguments.longitudeRef == "W"){
		coordinates.longitude *= -1;
	}
	return coordinates;
}
</cfscript>

