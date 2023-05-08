<cfset lTest = "||Just test|">
<cfset aCf = listToArray(lTest, '|')>
<cfdump var="#aCf#">

<cfset aJava = lTest.split("\|")>
<cfdump var="#aJava#">