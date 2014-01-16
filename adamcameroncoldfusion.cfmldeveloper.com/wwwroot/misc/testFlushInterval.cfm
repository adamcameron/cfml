<!--- testFlushInterval.cfm--->
<cfinclude template="./udfs.cfm">

<cfflush interval="100">

Beginning of request<br>
<cfset outputRandomLetters()>
<cfoutput>#makeHttpRequest()#<br></cfoutput>
After first pause<br>

<cfset outputRandomLetters()>
<cfoutput>#makeHttpRequest()#<br></cfoutput>
After second pause<br>

<cfset outputRandomLetters()>
<cfoutput>#makeHttpRequest()#<br></cfoutput>
End of request<br>