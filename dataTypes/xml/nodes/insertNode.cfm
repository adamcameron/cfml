<!--- base --->
<cfxml variable="x">
	<aaa id="1">
		<bbb id="2" />
		<bbb id="3" />
		<bbb id="4" />
	</aaa>
</cfxml>

<!--- append node --->
<cfset iNew = arrayLen(x.aaa.xmlChildren) + 1>
<cfset x.aaa.xmlChildren[iNew] = xmlElemNew(x, "ccc")>
<cfset x.aaa.xmlChildren[iNew].xmlAttributes["id"] = 5>
<cfset x.aaa.xmlChildren[iNew].xmlAttributes["name"] = "AppendedNode">


<!--- insert after sought node --->
<cfset aMatch = xmlSearch(x, "/aaa/bbb[@id='4']/preceding-sibling::bbb")>
<cfset iNew = arrayLen(aMatch) + 1>
<cfset arrayInsertAt(x.aaa.xmlChildren, iNew, xmlElemNew(x, "ddd"))>
<cfset x.aaa.xmlChildren[iNew].xmlAttributes["id"] = 6>
<cfset x.aaa.xmlChildren[iNew].xmlAttributes["name"] = "InsertedNode">

<cfdump var="#x#">
<pre>
<cfoutput>#htmlEditFormat(x)#</cfoutput>
</pre>