<cfset o1 = createObject("component", "cf.scopes.this.packageaccess.p1.c1")>
<cfdump var="#o1#">

<cftry>
	Calling packageMethod()&hellip;
	<cfoutput>#o1.packageMethod()#</cfoutput>&hellip;
	done<br />
	<cfcatch>
		error: <cfoutput>[#cfcatch.message#][#cfcatch.detail#]</cfoutput><br />
	</cfcatch>
</cftry>

<cfset o2 = createObject("component", "cf.scopes.this.packageaccess.p1.c2")>
<cfdump var="#o2#">

<cftry>
	Calling callPackageMethod()&hellip;
	<cfoutput>#o2.callPackageMethod()#</cfoutput>&hellip;
	done<br />
	<cfcatch>
		error: <cfoutput>[#cfcatch.message#][#cfcatch.detail#]</cfoutput><br />
	</cfcatch>
</cftry>


<cfset o3 = createObject("component", "cf.scopes.this.packageaccess.p2.c3")>
<cfdump var="#o3#">

<cftry>
	Calling callPackageMethod()&hellip;
	<cfoutput>#o3.callPackageMethod()#</cfoutput>&hellip;
	done<br />
	<cfcatch>
		error: <cfoutput>[#cfcatch.message#][#cfcatch.detail#]</cfoutput><br />
	</cfcatch>
</cftry>