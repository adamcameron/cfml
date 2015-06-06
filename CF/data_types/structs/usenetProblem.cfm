<cfset strPerson1 = structNew()>
<cfset strPerson1.firstName = "Jean">
<cfset strPerson1.lastName = "Dupont">
<cfset strPerson1.city = "Paris">

<cfset strPerson2 = structNew()>
<cfset strPerson2.firstName = "Pierre">
<cfset strPerson2.lastName = "Lemont">
<cfset strPerson2.city = "Provence">


<cfset strPerson = structNew()>
<cfset strPerson[1] = strPerson1>
<cfset strPerson[2] = strPerson2>





<cfset str1Person1 = structNew()>
<cfset str1Person1.firstName = "Jean1">
<cfset str1Person1.lastName = "Dupont1">
<cfset str1Person1.city = "Pari1s">

<cfset str1Person2 = structNew()>
<cfset str1Person2.firstName = "Pierre1">
<cfset str1Person2.lastName = "Lemont1">
<cfset str1Person2.city = "Provenc1e">


<cfset str1Person = structNew()>
<cfset str1Person[1] = str1Person1>
<cfset str1Person[2] = str1Person2>


<cfset myQuery = QueryNew("Name, Time, Advanced")>

<cfset newRow = QueryAddRow(MyQuery, 2)>

<!--- Set the values of the cells in the query --->
<cfset temp = QuerySetCell(myQuery, "Name", "The Wonderful World of CMFL", 1)>
<cfset temp = QuerySetCell(myQuery, "Time", "9:15 AM", 1)>
<cfset temp = QuerySetCell(myQuery, "Advanced", strPerson, 1)>
<cfset temp = QuerySetCell(myQuery, "Name", "CFCs for Enterprise Applications", 2)>
<cfset temp = QuerySetCell(myQuery, "Time", "12:15 PM", 2)>
<cfset temp = QuerySetCell(myQuery, "Advanced", str1Person, 2)>


<cfdump var="#myQuery#">

<cfoutput>structcount: #structCount(myQuery.advanced[2])#</cfoutput>
<cfdump var="#myQuery.advanced[2]#">

<cfoutput query="myQuery" startrow="2" maxrows="1">
	structcount: #structCount(advanced)#
	<cfdump var="#advanced#">
</cfoutput>
