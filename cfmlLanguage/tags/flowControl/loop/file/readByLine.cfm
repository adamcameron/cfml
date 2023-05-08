<cfset iStart = getTickCount()>
<cflog application="false" file="fileread" type="information" text="Start (#getTickCount()-iStart#)">
<cfset i = 0>
<cfloop index="sLine" file="#expandPath('./data.txt')#">
	<cfif i mod 1000>
		<cflog application="false" file="fileread" type="information" text="Inside Loop #i# (#getTickCount()-iStart#)">
	</cfif>
	<cfset i=i+1> 
</cfloop>

<cflog application="false" file="fileread" type="information" text="End (#getTickCount()-iStart#)">