<cffunction name="f">
	<cfset var ftpConn = false>

	<cfftp	connection	= "ftpConn"
			username	= "administrator"
			password	= "K1m&T3rry"
			server		= "localhost"
			action		= "open"
			stopOnError = "Yes">
	<cfreturn ftpConn>
</cffunction>

<cfset myConn = f()>
<cfdump var="#myConn#">