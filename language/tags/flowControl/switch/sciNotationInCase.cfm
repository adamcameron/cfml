<cfparam name="url.test" default="1">

<cfswitch expression="#url.test#">
	<cfcase value="5200"><!--- which could also be 52E2 --->
		
		<cfif not compare(test, "5200")>
			It was 5200<br />
		<cfelseif not compare(test, "52E2")>
			It was 52E2<br />
		<cfelse>
			It was some other variation that can be interpretted as "5200"<br />
		</cfif>
	</cfcase>
	<cfdefaultcase>
		It was something else entirely
	</cfdefaultcase>
</cfswitch>