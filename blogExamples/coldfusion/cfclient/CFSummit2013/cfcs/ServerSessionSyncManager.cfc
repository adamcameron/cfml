<!---
	This is a server side CFC. Returns session update info to client
--->
<cfcomponent >
	<cffunction name="getSessionUpdates" access="remote" returnformat="JSON" >
		<cfargument name="fromUpdateId" default="0">
		
		<cfset result = arrayNew(1)>
		
		<cfquery datasource="cfsummit2013" name="q1">
			select * from SCHEDULE_UPDATES where UPDATE_ID > #fromUpdateId#
			order by UPDATE_ID
		</cfquery>
		
		<cfloop query="q1">
			<cfscript>
				var st = structNew();
				st.update_id = UPDATE_ID;
				st.session_id = SESSION_ID;
				st.session_name = NAME;
				st.session_info = SESSION_INFO;
				st.session_type = SESSION_TYPE;
				st.speaker_name = SPEAKER_NAME;
				st.start_time = START_TIME;
				st.end_time = END_TIME;
				st.day = DAY;
				st.room = ROOM;
				st.operation = OPERATION;
				
				result.append(st);
			</cfscript>
		</cfloop>
		
		<cfreturn result>
		
	</cffunction>
</cfcomponent>