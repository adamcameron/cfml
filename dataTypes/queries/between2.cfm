<cfscript>
	d = now();
	
	q = queryNew("dateData", "date");
	queryAddRow(q);
	querySetCell(q, "dateData", d);
</cfscript>
<cfdump var="#q#">
<cftry>
	<cfquery name="QoQ" dbtype="query">
		select	*
		from	q
		where 	dateData = #d#
	</cfquery>
	<cfdump var="#qoq#">
	<cfcatch>[#d#] didn't work<br /></cfcatch>
</cftry>
<cftry>
	<cfquery name="QoQ" dbtype="query">
		select	*
		from	q
		where 	dateData = '#d#'
	</cfquery>
	<cfdump var="#qoq#">
	<cfcatch>['#d#'] didn't work<br /></cfcatch>
</cftry>
<cftry>
	<cfquery name="QoQ" dbtype="query">
		select	*
		from	q
		where 	dateData = #createODBCDate(d)#
	</cfquery>
	<cfdump var="#qoq#">
	<cfcatch>[#createODBCDate(d)#] didn't work<br /></cfcatch>
</cftry>
<cftry>
	<cfquery name="QoQ" dbtype="query">
		select	*
		from	q
		where 	dateData = '#createODBCDate(d)#'
	</cfquery>
	<cfdump var="#qoq#">
	<cfcatch>['#createODBCDate(d)#'] didn't work<br /></cfcatch>
</cftry>
<cftry>
	<cfquery name="QoQ" dbtype="query">
		select	*
		from	q
		where 	dateData = #createODBCDateTime(d)#
	</cfquery>
	<cfdump var="#qoq#">
	<cfcatch>[#createODBCDateTime(d)#] didn't work<br /></cfcatch>
</cftry>
<cftry>
	<cfquery name="QoQ" dbtype="query">
		select	*
		from	q
		where 	dateData = '#createODBCDateTime(d)#'
	</cfquery>
	<cfdump var="#qoq#">
	<cfcatch>['#createODBCDateTime(d)#'] didn't work<br /></cfcatch>
</cftry>
<cftry>
	<cfquery name="QoQ" dbtype="query">
		select	*
		from	q
		where 	dateData = #preserveSingleQuotes(d)#
	</cfquery>
	<cfdump var="#qoq#">
	<cfcatch>[#preserveSingleQuotes(d)#] didn't work<br /></cfcatch>
</cftry>
<cftry>
	<cfquery name="QoQ" dbtype="query">
		select	*
		from	q
		where 	dateData = '#preserveSingleQuotes(d)#'
	</cfquery>
	<cfdump var="#qoq#">
	<cfcatch>['#preserveSingleQuotes(d)#'] didn't work<br /></cfcatch>
</cftry>
<cfset d = createODBCDate(d)>
<cftry>
	<cfquery name="QoQ" dbtype="query">
		select	*
		from	q
		where 	dateData = #preserveSingleQuotes(d)#
	</cfquery>
	<cfdump var="#qoq#">
	<cfcatch>[#preserveSingleQuotes(createODBCDate(d))#] didn't work<br /></cfcatch>
</cftry>
<cftry>
	<cfquery name="QoQ" dbtype="query">
		select	*
		from	q
		where 	dateData = '#preserveSingleQuotes(d)#'
	</cfquery>
	<cfdump var="#qoq#">
	<cfcatch>['#preserveSingleQuotes(createODBCDate(d))#'] didn't work<br /></cfcatch>
</cftry>
<cfset d = createODBCDateTime(d)>
<cftry>
	<cfquery name="QoQ" dbtype="query">
		select	*
		from	q
		where 	dateData = #preserveSingleQuotes(d)#
	</cfquery>
	<cfdump var="#qoq#">
	<cfcatch>[#preserveSingleQuotes(createODBCDateTime(d))#] didn't work<br /></cfcatch>
</cftry>
<cftry>
	<cfquery name="QoQ" dbtype="query">
		select	*
		from	q
		where 	dateData = '#preserveSingleQuotes(d)#'
	</cfquery>
	<cfdump var="#qoq#">
	<cfcatch>['#preserveSingleQuotes(createODBCDateTime(d))#'] didn't work<br /></cfcatch>
</cftry>
<cftry>
	<cfquery name="QoQ" dbtype="query">
		select	*
		from	q
		where 	dateData = '#dateFormat(d)#'
	</cfquery>
	<cfdump var="#qoq#">
	<cfcatch>['#dateFormat(d)#'] didn't work<br /></cfcatch>
</cftry>
<cftry>
	<cfset dateString = "#dateFormat(d, 'yyyy-mm-dd')#">
	<cfquery name="QoQ" dbtype="query">
		select	*
		from	q
		where 	dateData = #dateString#
	</cfquery>
	<cfdump var="#qoq#">
	<cfdump var="#dateString#"><br />
	<cfdump var="#dateString eq d#"><br />
	<cfcatch>[#dateFormat(d, "yyyy-mm-dd")#] didn't work<br /></cfcatch>
</cftry>
<cftry>
	<cfset dateString = "#dateFormat(d, 'yyyy-mm-dd')#">
	<cfquery name="QoQ" dbtype="query">
		select	*
		from	q
		where 	dateData = '#dateString#'
	</cfquery>
	<cfdump var="#qoq#"><!--- doesn't break, butstill doesn't match anything --->
	<cfdump var="#dateString#"><br />
	<cfdump var="#dateString eq d#"><br />
	<cfcatch>['#dateFormat(d, "yyyy-mm-dd")#'] didn't work<br /></cfcatch>
</cftry>
<cftry>
	<cfset dateString = "#dateFormat(d, 'yyyy-mm-dd')# #timeFormat(d, 'HH:MM:SS')#">
	<cfquery name="QoQ" dbtype="query">
		select	*
		from	q
		where 	dateData = #dateString#
	</cfquery>
	<cfdump var="#qoq#">
	<cfdump var="#dateString#"><br />
	<cfdump var="#dateString eq d#"><br />
	<cfcatch>[#dateFormat(d, 'yyyy-mm-dd')# #timeFormat(d, 'HH:MM:SS')#] didn't work<br /></cfcatch>
</cftry>
<cftry>
	<cfset dateString = "#dateFormat(d, 'yyyy-mm-dd')# #timeFormat(d, 'HH:MM:SS')#">
	<cfquery name="QoQ" dbtype="query">
		select	*
		from	q
		where 	dateData = '#dateString#'
	</cfquery>
	<cfdump var="#qoq#"><!--- doesn't break, butstill doesn't match anything --->
	<cfdump var="#dateString#"><br />
	<cfdump var="#dateString eq d#"><br />
	<cfcatch>['#dateFormat(d, 'yyyy-mm-dd')# #timeFormat(d, 'HH:MM:SS')#'] didn't work<br /></cfcatch>
</cftry>
