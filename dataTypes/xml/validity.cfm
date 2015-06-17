<cfxml variable="x">
	<cfoutput>
		<urls>
		<url base="#xmlFormat('http://www.imdb.com?something=somethignelse&thingey=awumba')#">
			#xmlFormat('http://www.cricket.org?splem=curds&wey=spider')#
		</url>
		<url base="http://www.straker.co.nz?page=1&amp;circuit=2">
			#xmlFormat('http://www.macromedia.com?somethin=somethingelse&amp;another=!@##$%^&*(<>[])_+=_\/.,?|]]>')#
		</url>
		</urls>
	</cfoutput>
</cfxml>

<cfdump var="#x#">

<cfoutput>
#htmlEditFormat(toString(x))#
</cfoutput>