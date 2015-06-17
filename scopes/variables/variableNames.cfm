<cfprocessingdirective pageencoding="utf-8">
<cftry>
	&lt;cfset _foo = "bar"><br />
	<cfset _foo = "bar">
	<cfcatch>
		<cfoutput>#cfcatch.message# #cfcatch.detail#<br /></cfoutput>
	</cfcatch>
</cftry>
<cftry>
	&lt;cfset $foo = "bar"><br />
	<cfset $foo = "bar">
	<cfcatch>
		<cfoutput>#cfcatch.message# #cfcatch.detail#<br /></cfoutput>
	</cfcatch>
</cftry>
<cftry>
	&lt;cfset £foo = "bar"><br />
	<cfset £foo = "bar">
	<cfcatch>
		<cfoutput>#cfcatch.message# #cfcatch.detail#<br /></cfoutput>
	</cfcatch>
</cftry>

<cftry>
	&lt;cfset foo$ = "bar"><br />
	<cfset foo$ = "bar">
	<cfcatch>
		<cfoutput>#cfcatch.message# #cfcatch.detail#<br /></cfoutput>
	</cfcatch>
</cftry>
<cftry>
	&lt;cfset foo£ = "bar"><br />
	<cfset foo£ = "bar">
	<cfcatch>
		<cfoutput>#cfcatch.message# #cfcatch.detail#<br /></cfoutput>
	</cfcatch>
</cftry>
<cftry>
	&lt;cfset £50 = "bar"><br />
	<cfset £50 = "bar">
	<cfcatch>
		<cfoutput>#cfcatch.message# #cfcatch.detail#<br /></cfoutput>
	</cfcatch>
</cftry>
<cftry>
	&lt;cfset $50 = "bar"><br />
	<cfset $50 = "bar">
	<cfcatch>
		<cfoutput>#cfcatch.message# #cfcatch.detail#<br /></cfoutput>
	</cfcatch>
</cftry>
<cftry>
	&lt;cfset ¥50 = "bar"><br />
	<cfset ¥50 = "bar">
	<cfcatch>
		<cfoutput>#cfcatch.message# #cfcatch.detail#<br /></cfoutput>
	</cfcatch>
</cftry>
<cftry>
	&lt;cfset €50 = "bar"><br />
	<cfset €50 = "bar">
	<cfcatch>
		<cfoutput>#cfcatch.message# #cfcatch.detail#<br /></cfoutput>
	</cfcatch>
</cftry>
<cftry>
	&lt;cfset μ50 = "bar"><br />
	<cfset μ50 = "bar">
	<cfcatch>
		<cfoutput>#cfcatch.message# #cfcatch.detail#<br /></cfoutput>
	</cfcatch>
</cftry>
<cfdump var="#variables#">