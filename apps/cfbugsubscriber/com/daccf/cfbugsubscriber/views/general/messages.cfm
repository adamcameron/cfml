<cfif structKeyExists(rc, "messages") AND arrayLen(rc.messages)>
	<div class="messages">
		Problem<cfif arrayLen(rc.messages) GT 1>s</cfif> with form submission:
		<ul>
		<cfloop array="#rc.messages#" index="prc.message">
			<li><cfoutput>#prc.message#</cfoutput></li>
		</cfloop>
		</ul>	
	</div>
	<br />
</cfif>