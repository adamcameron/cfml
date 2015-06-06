<cfset o = createObject("java", "TestThis")>

<cfoutput>
o.publicMethod(): [#o.publicMethod()#]<br />
o.privateWrapperMethod(): [#o.privateWrapperMethod()#]<br />
</cfoutput>
