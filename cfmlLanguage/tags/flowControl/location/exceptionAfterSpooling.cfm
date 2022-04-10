<!--- exceptionAfterSpooling.cfm --->
<cfoutput>#repeatstring("x", 1048576)#</cfoutput>
<cfthrow type="SomeException">