<cfscript>
	st = structNew();
	st[1] = structNew(); st[1].name = "Adam"; st[1].status = true;
st[2] = structNew(); st[2].name = "Bob"; st[2].status = false;
st[3] = structNew(); st[3].name = "Charlie"; st[3].status = true;
	
	aByValue = structFindValue(st, true, "all");
	aByKey = structFindKey(st, "status", "all");
</cfscript>

<cfscript>
	st = structNew();
	st["Adam"] = structNew(); st["Adam"].status = true;
	st["Bob"] = structNew(); st["Bob"].status = false;
	st["Charlie"] = structNew(); st["Charlie"].status = true;
	st["Dave"] = structNew(); st["Dave"].someOtherKey = true;

	aByValue = structFindValue(st, true, "all");
	aByKey = structFindKey(st, "status", "all");

</cfscript>
<!--- 
<cfdump var="#aByValue#">
<cfdump var="#aByKey#"> --->
<cfxml variable="x">
	<st>
		<person name="Adam" status="true" />
		<person name="Bob" status="false" />
		<person name="Charlie" status="true" />
	</st>
</cfxml>
<cfset a = xmlSearch(x, "/st/person[@status='true']")>
<cfdump var="#a#">
