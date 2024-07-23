<cfset iStart = getTickCount()>
<cfparam name="URL.timeout" default="1" type="integer">
<cfsetting requesttimeout="#URL.timeout#">
<cfset createObject("java", "java.lang.Thread").sleep(javaCast("int",(URL.timeout+1)*1000))>
Execution time: <cfoutput>#getTickCount() - iStart#</cfoutput>
