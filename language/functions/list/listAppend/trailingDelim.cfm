<cfset sFirst = "one">
<cfset sSecond = "">
<cfset sThird = "">
<cfset myList = "">
<cfset myList = listAppend(myList, sFirst)>
<cfoutput>[#myList#]<br /></cfoutput>
<cfset myList = listAppend(myList, sSecond)>
<cfoutput>[#myList#]<br /></cfoutput>
<cfset myList = listAppend(myList, sThird)>
<cfoutput>[#myList#]<br /></cfoutput>

