<cffunction name="structBuild">
	<cfreturn arguments>
</cffunction>
<cfinvoke method="sayHello" returnvariable="test" webservice="http://localhost/adam_junk/tests/cfcs/webservice/myws.cfc?wsdl" dbConnection="#structBuild(username='Adam', password='Cameron')#">
<cfoutput>#test#</cfoutput>
<cfsetting showdebugoutput="no">