<cfset oFoo = createObject("component", "Foo")>
<cfset aFoos = oFoo.getFoos()>
<cfdump var="#variables#">

<cfscript>
	Foo[] function getFoos() output="no" {
		var mycfc = createObject("component", "Foo");
		var result = [];
		result[1] = mycfc;
		return result;
	}
</cfscript>