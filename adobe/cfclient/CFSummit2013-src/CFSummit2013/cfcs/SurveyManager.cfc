<!---
	Server side CFC to save surveys submitted by users.
--->
<cfcomponent >
	
	<cfheader name="Access-Control-Allow-Origin" value="*">
		
	<cffunction name="onSurveySubmit" access="remote" returnformat="JSON" >
		<cfargument name="surveyDtls" >
		
		<!--- Summit is closed now. Do not accept any survey submissions --->
		<cfreturn {"code":"error","message":"CFSummit2013 is now closed"}>
		
		<cftry>
			<cfset saveSurvey(surveyDtls)>
		<cfcatch type="any" >
			<cfreturn {"code":"error","message":cfcatch.message}>
			<cfreturn >		
		</cfcatch>
		</cftry>
			
		<cfreturn {"code":"success","message":"Thank you for your feedback"}>
	</cffunction>
	
	<cffunction name="saveSurvey" >
		<cfargument name="surveyDtls" >
		
		<cfif surveyDtls.email eq "">
			<cfthrow message="Email id is a requied field.">
		</cfif>
		
		<cfquery datasource="cfsummit2013" name="q1">
			select * from ATTENDEES where EMAIL =
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#surveyDtls.email#">
		</cfquery>
		
		<cfif q1.RecordCount eq 0>
			<cfthrow message="Cannot submit the survey. You are not a registered attendee">
		</cfif>
		
		<cfset sessionkey = surveyDtls.sessionid & "_" & surveyDtls.email>
		
		<cfquery datasource="cfsummit2013" name="select">
			select * from SURVEYRESULT where RESULTID = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" 
		              value="#sessionkey#">
		</cfquery>

		
		<cfset epochDate = DateDiff("s",DateConvert("utc2Local", "January 1 1970 00:00"),now())>
	
		<cfif select.RecordCount gt 0>
			<!--- 
				For some reason, on the first day of the conference, the update statement
				started throwing DB exception. It was working fine before that.
				I have not yet debugged the issue. For now, I am disabling the update
				-Ram
			--->
			<cfthrow message="You have already submitted the survey for this session.">

			<cfquery datasource="cfsummit2013">
				update surveyresult set
				WELLORGANIZED=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#surveyDtls.wellOrganized#">
				,
				SESSIONID=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#surveyDtls.sessionid#">
				,
				SESSEVALUATION=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#surveyDtls.sessEvaluation#">
				,
				RECOMMEND=<cfqueryparam cfsqltype="CF_SQL_BIT" value="#surveyDtls.recommend#">
				,
				PRESSKILLS=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#surveyDtls.presSkills#">
				,
				MATCHTITLE=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#surveyDtls.matchTitle#">
				,
				KNOWEVALUATION=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#surveyDtls.knowEvaluation#">
				,
				INFOPRESENTED=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#surveyDtls.infoPresented#">
				,
				EXPECTATION=<cfqueryparam cfsqltype="CF_SQL_BIT" value="#surveyDtls.expectation#">
				,
				EMAIL=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#surveyDtls.email#">
				,
				EDULEVEL=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#surveyDtls.eduLevel#">
				,
				COMMENTS=<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#surveyDtls.comments#">
				where RESULTID = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#sessionkey#">
				,
				TIME_SUBMITTED=<cfqueryparam cfsqltype="cf_sql_bigint" value="#epochDate#">
			
			</cfquery>
<cfdump var="After update" output="C:/inetpub/wwwroot/CFSummit2013/cfcs/dump.txt" >

		<cfelse>
			<cfquery datasource="cfsummit2013">
				insert into surveyresult values(
				<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#sessionkey#">
				, <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#surveyDtls.email#">
				,<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#surveyDtls.sessionid#">
				,<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#surveyDtls.sessEvaluation#">
				,<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#surveyDtls.infoPresented#">
				,<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#surveyDtls.wellOrganized#">
				,<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#surveyDtls.matchTitle#">
				,<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#surveyDtls.eduLevel#">
				,<cfqueryparam cfsqltype="CF_SQL_BIT" value="#surveyDtls.expectation#">
				,<cfqueryparam cfsqltype="CF_SQL_BIT" value="#surveyDtls.recommend#">
				,<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#surveyDtls.knowEvaluation#">
				,<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#surveyDtls.presSkills#">
				,<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#surveyDtls.comments#">
				,<cfqueryparam cfsqltype="cf_sql_bigint" value="#epochDate#">
				)
			</cfquery>
		</cfif>
	</cffunction>
</cfcomponent>