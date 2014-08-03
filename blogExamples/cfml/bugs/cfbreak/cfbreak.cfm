<!--- cfbreak.cfm --->
<cfparam name="URL.test" default="">

<cfset originalExpression = URL.test>

<cfswitch expression="#originalExpression#">
	<cfcase value="Test,Another,Yes,No">
		stuff common to all of TEST,ANOTHER,YES,NO<br>

		<!--- stuff specific to various cases --->
		<cfif originalExpression EQ "test">
			stuff specific to TEST<br>
			<cfbreak>
		</cfif>
		<cfif listFindNoCase("Yes,No", originalExpression)>
			stuff specific to YES,NO<br>
			<cfbreak>
		</cfif>
		stuff specific to ANOTHER<br>
    </cfcase>

    <cfcase value="otherCase">
    	stuff specific to OTHERCASE<br>
    </cfcase>

    <cfdefaultcase>
		default case<br>    	
    </cfdefaultcase>
</cfswitch>