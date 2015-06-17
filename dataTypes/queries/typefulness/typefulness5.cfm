<cfdirectory directory="C:\Inetpub\www root\adam_junk\" action="list" name="dir">
<cfdump var="#dir#">
<cfdump var="#dir.getColumnNames()#">
<cfoutput>
<cfloop index="i" from="1" to="#arrayLen(dir.getColumnNames())#">
	#dir.getMetaData().getColumnTypeName(javaCast("int",i))#	<br />
</cfloop>
</cfoutput>