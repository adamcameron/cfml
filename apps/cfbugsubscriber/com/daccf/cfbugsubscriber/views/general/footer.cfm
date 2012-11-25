<cfset prc.isLoggedIn = getPlugin("SessionStorage").getVar("isLoggedIn")>
<cfset prc.isLoggedIn = len(prc.isLoggedIn) AND isBoolean(prc.isLoggedIn) AND prc.isLoggedIn>
<hr />
<cfoutput>
	<ul>
	<li><a href="#event.buildLink(linkTo="main.index")#">Home</a></li>
	<cfif prc.isLoggedIn>
		<li><a href="#event.buildLink(linkTo="account.update")#">Edit Your Details</a></li>
		<li><a href="#event.buildLink(linkTo="user.logout")#">Logout</a></li>
	</cfif>
	</ul>
</cfoutput>
<cfdump var="#getPlugin("SessionStorage").getStorage()#">