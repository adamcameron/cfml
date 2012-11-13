<cfset prc.header = event.getValue(name="title", defaultValue="", private=true)>
<cfoutput>
	<header>
	<cfif len(prc.header)>
		<h1>#prc.header#</h1>
	</cfif>
	</header>
	<div id="content">
		#renderView()#
	</div>
	<footer>
	#renderView("general/footer")#
	</footer>
</cfoutput>