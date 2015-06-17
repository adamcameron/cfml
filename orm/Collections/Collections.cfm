<cfset artists = EntityLoad("artists")>

<cfoutput><b>Display the Artist name and his arts which we got as an array<br /></b></cfoutput>
<cfloop array="#artists#" index="artist">
	<cfset artNameArray = artist.getArtNamesAsArray()>
    <cfoutput><b>#artist.getFirstName()# #artist.getLastName()# has created - </b></cfoutput><br />
    <cfloop array="#artNameArray#" index="artName">
        <cfoutput>#artName#<br /></cfoutput>
    </cfloop>
</cfloop>
<br />

<cfoutput><b>Display the Artist name and his arts which we got as struct<br /></b></cfoutput>
<cfloop array="#artists#" index="artist">
	<cfset artNameStruct = artist.getArtNamesAsStruct()>
    <cfoutput><b>#artist.getFirstName()# #artist.getLastName()# has created - </b></cfoutput><br />
    <cfloop array="#StructKeyArray(artNameStruct)#" index="key">
    	<cfoutput>#key#: #artNameStruct.get(javacast("int", key))#<br /></cfoutput>
    </cfloop>
</cfloop>
