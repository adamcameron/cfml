<!--- TestExpectedExceptionTags.cfc --->
<cfcomponent extends="mxunit.framework.TestCase">
	
	<cffunction name="testExpectedExceptionPass" returntype="void" access="public" mxunit:expectedexception="AnExpectedException">
		<cfthrow type="AnExpectedException" message="You should have expected that!">
	</cffunction>

	<cffunction name="testUnexpectedExceptionFail" returntype="void" access="public" mxunit:expectedexception="AnExpectedException">
		<cfthrow type="AnUnexpectedException" message="You didn't expect that!">
	</cffunction>

</cfcomponent>
