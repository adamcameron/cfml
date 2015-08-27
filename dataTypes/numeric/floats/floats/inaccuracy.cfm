<cfset theList = "20,20,9.4,7.9,7.8,7.6,7.4,7.3,7.3,5.3">
<cfset theList = "9.4,7.9,7.8,7.6,7.4,7.3,7.3,5.3,20,20">
<cfset theArray = ListToArray(theList)>
<cfset theArraySum = ArraySum(theArray)>
<cfoutput>
	<h3>The sum of the array is: #theArraySum#</h3>
	<h3>The sum of the array is: #javaCast("float", theArraySum)#</h3>
	<h3>The sum of the array #iif(theArraySum eq 100,de("does"),de("does not"))# equal 100.</h3>
</cfoutput>


