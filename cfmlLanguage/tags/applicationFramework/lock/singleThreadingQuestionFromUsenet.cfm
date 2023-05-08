<cfflush interval="128">
<cfset iStart = getTickCount()>
<cfoutput>

<cfparam name="url.work" default="false" type="boolean">
#feedback(message="Before &lt;cflock&gt;")#
<cfflush>
<!--- <cflock timeout="5" scope="session" type="readonly"> --->
	#feedback(message="Top of &lt;cflock&gt;")#
	<cfif url.work>
		<!--- simulate long calculation/operation --->
		#feedback(message="Before sleep()")#
		<cfset createObject('java', 'java.lang.Thread').init().sleep(5000)>
		<!--- comment this line out and then on the second browser, hit ctrl-f5 --->
		#feedback(message="After sleep()")#
	</cfif>
<!--- </cflock> --->
#feedback(message="After &lt;cflock&gt;")#
#url.work#<br />
#feedback(message="End Test")#
Execution time: [#getTickCount() - iStart#]
</cfoutput>
<cffunction name="feedback" output="false" returntype="string">
	<cfargument name="message" type="string" required="true">
	<cfreturn '[#timeFormat(now(), "HH:MM:SS.LLL")#] #arguments.message#<br />#repeatString(" ", 256)#'>
</cffunction>