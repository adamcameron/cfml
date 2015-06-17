<cffunction name="f1" access="public">
	f1 is public<br />
</cffunction>

<cffunction name="f2" access="public">
	f2 is public<br />
	<cfset f3()>
</cffunction>

<cffunction name="f3" access="private">
	f1 is private<br />
</cffunction>
