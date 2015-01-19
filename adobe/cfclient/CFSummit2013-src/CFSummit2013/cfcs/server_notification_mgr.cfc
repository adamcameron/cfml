<!---
	This is a server side CFC to send notifications from the server to client
--->
<cfcomponent >
	<cfheader name="Access-Control-Allow-Origin" value="*">
	
	<cffunction name="getNotifications" access="remote" returnformat="JSON" >
		<cfargument name="fromIdArg" default="1" type="numeric" >
		
		<cfquery datasource="cfsummit2013" name="q1">
			select * from notifications where 
				notification_id > <cfqueryparam cfsqltype="cf_sql_numeric" value="#fromIdArg#">
				order by notification_id desc
		</cfquery>
		
		<cfset result = arrayNew(1)>
		
		<cfloop query="q1">
			<cfset st = structNew()>
			<cfset st.id = q1.notification_id>
			<cfset st.title = q1.title>
			<cfset st.desc = q1.descr>
			<cfset st.sent_on = q1.sent_on>
			
			<cfset arrayAppend(result,st)>
		</cfloop>
		
		<cfreturn result>
	</cffunction>
	

</cfcomponent>
