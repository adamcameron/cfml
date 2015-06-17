<cftry>
	<cfthrow>
	<cfcatch>
		<cfset o = cfcatch>
	</cfcatch>
</cftry>

<cfoutput>
	isStruct(o): #isStruct(o)#<br />
	isValid("struct", o): #isValid("struct", o)#<br />
	o.getClass(): #o.getClass()#<br />
	isObject(o): #isObject(o)#<br />
</cfoutput>

<cftry>
	<cfparam name="variables.o" type="struct">
	<cfcatch>
		<cfdump var="#cfcatch#">
	</cfcatch>
</cftry>