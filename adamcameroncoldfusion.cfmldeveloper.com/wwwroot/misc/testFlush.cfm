<!--- testFlush.cfm --->
<cfinclude template="./udfs.cfm">

Beginning of request<br>
<cfset outputRandomLetters()>
<cfflush>

<cfoutput>#makeHttpRequest()#<br></cfoutput>
After first flush<br>
<cfset outputRandomLetters()>
<cfflush>

<cfoutput>#makeHttpRequest()#<br></cfoutput>
After second flush<br>
<cfset outputRandomLetters()>
<cfflush>

<cfoutput>#makeHttpRequest()#<br></cfoutput>
End of request<br>
