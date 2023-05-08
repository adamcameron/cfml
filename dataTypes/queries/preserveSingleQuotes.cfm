<cfset str = "'stringdata',2">
<cfquery name="ins" datasource="adam_junk2">
	insert into table1(
		typecol, datacol
	)values(
		#preserveSingleQuotes(str)#
	)
</cfquery>