<cfcomponent output="false">


	<cffunction name="ping" access="remote" returntype="string" output="false">
		<cfargument name="message" type="string" required="true">
		<cfreturn "[#dateFormat(now(), 'yyyy-mm-dd')# #timeFormat(now(), 'HH:MM:SS.LLL')#] [#createObject("java", "jrunx.kernel.JRun").getServerName()#] Message [#arguments.message#] received.">
	</cffunction>


</cfcomponent>