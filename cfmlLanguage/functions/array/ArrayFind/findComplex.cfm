<cfset st = {number="two"}>
<cfset a = ["one", st]>
<cfoutput>
arrayFind(a, st):[#arrayFind(a, st)#]<br />
</cfoutput>
