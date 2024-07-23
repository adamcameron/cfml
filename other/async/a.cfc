<cfcomponent output="false">


	<cffunction name="onIncomingMessage" output="false">
		<cfargument name="CFEvent" type="struct" required="true">
		<cfset var sDump ="">

		<cfsavecontent variable="sDump">
			<cfdump var="#arguments#" label="arguments @ #timeFormat(now(), 'HH:MM:SS.LLL')#">
		</cfsavecontent>
		<cffile action="append" file="C:\temp\async_debug.html" output="#sDump#">
	</cffunction>


</cfcomponent>