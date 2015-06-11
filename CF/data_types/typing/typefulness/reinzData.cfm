<cfquery name="userData" datasource="reinzshado">
select * from users
order by user_loginid
</cfquery>

<cfquery name="qoq" dbtype="query">
	select	*
	from	userData
	where	user_loginid = 'testadmin'
</cfquery>
<cfdump var="#qoq#">