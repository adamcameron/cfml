<cfflush interval="32">
Before Lock<br /><cfoutput>#repeatString(" ", 128)#</cfoutput>
<cflock name="LockMe" type="exclusive" throwontimeout="false" timeout="5">
	Within Lock<br /><cfoutput>#repeatString(" ", 128)#</cfoutput>
	Before query<br /><cfoutput>#repeatString(" ", 128)#</cfoutput>

	<cfquery name="q" datasource="intranet">
		select o.*, '#createUuid()#' as uniqifier
		from tbl_tree_objects o
		where obj_title in (
			select circuit_title from circuits
		)
	</cfquery>

	After query<br /><cfoutput>#repeatString(" ", 128)#</cfoutput>
</cflock>
After Lock<br /><cfoutput>#repeatString(" ", 128)#</cfoutput>