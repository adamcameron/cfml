<cfscript>
	function delay(){	// emulates processing that takes some time
		sleep(randRange(1,5) * 1000);
	}
</cfscript>

<cfset start = getTickCount()>
<cfthread action="run" name="dealWithHeaders">
	<cfset delay()>
	<cfheader name="from" value="adam@example.com">
</cfthread>
<cfthread action="run" name="dealWithCookies">
	<cfset delay()>
	<cfcookie name="testCookie" value="#createUuid()#">
</cfthread>
<cfthread action="run" name="dealWithContentType">
	<cfset delay()>
	<cfcontent type="text/plain">
</cfthread>
<cfthread action="join" name="dealWithHeaders,dealWithCookies,dealWithContentType" />

<cfoutput>
Individual threads:
<cfloop collection="#cfthread#" item="thread">
	#cfthread[thread].name#: #cfthread[thread].elapsedTime#ms#chr(13)#
</cfloop>
Total: #getTickCount()-start#ms
</cfoutput>