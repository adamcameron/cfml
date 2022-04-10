<cfset l1 = ",,1,2,,3,4,,,5,,,,6,7,,8,,9,,">

<cfset sPlaceholder = "x">
<cfset l2 = reReplace(l1, "(^,)|((,)(?=,))|(,$)", ",#sPlaceholder#", "ALL")>

<cfset l3 = reReplace(l1, "((,)(?=,))|(,$)", ",#sPlaceholder#", "ALL")>
<cfset l3 = reReplace(l3, "(^,)", "#sPlaceholder#,", "ALL")>


<cfset l4 = "x,x,1,2,x,3,4,x,x,5,x,x,x,6,7,x,8,x,9,x,x">
<cfoutput>
	[#l1#][#listLen(l1)#]<br />
	[#l2#][#listLen(l2)#]<br />
	[#l3#][#listLen(l3)#]<br />
	[#l4#][#listLen(l4)#]<br />
</cfoutput>
<!--- manually --->
