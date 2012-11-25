<cfset prc.isLoggedIn = getPlugin("SessionStorage").getVar("isLoggedIn")>
<cfset prc.isLoggedIn = len(prc.isLoggedIn) AND isBoolean(prc.isLoggedIn) AND prc.isLoggedIn>
<hr />
<cfoutput>
	<ul>
	<li><a href="#event.buildLink(linkTo="main.index")#">Home</a></li>
	<cfif prc.isLoggedIn>
		<li><a href="#event.buildLink(linkTo="account.updateForm")#">Edit Your Details</a></li>
		<li><a href="#event.buildLink(linkTo="authorisation.logout")#">Logout</a></li>
	</cfif>
	</ul>
</cfoutput>