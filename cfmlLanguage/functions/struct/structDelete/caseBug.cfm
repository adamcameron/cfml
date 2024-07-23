<cfoutput>
	<form action="" method="post">

		testField: <input type="text" name="testField" /><br/>

		<input type="submit" />

	</form>

	<cfif structCount( form ) gt 0 >
		<cfset bugUppercase( argumentCollection = form ) />
		<cfset bugCamelcase( argumentCollection = form ) />
	</cfif>

	<cffunction name="bugUppercase" >
		Upper before deletion: #structCount( form )#<br/>
		<cfdump var="#form#" label="Before">
		<cfset structDelete( form, "TESTFIELD" ) />
		Upper after deletion: #structCount( form )#<br/>
		<cfdump var="#form#" label="After">
	</cffunction>

	<cffunction name="bugCamelcase" >
		Camel before deletion: #structCount( arguments )#<br/>
		<cfset structDelete( arguments, "testField" ) />
		Camel after deletion: #structCount( arguments )#<br/>

	</cffunction>

</cfoutput>
