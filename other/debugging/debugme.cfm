<cfflush interval="16">
<cfset u = createUuid()>
<cfoutput>UUID: [#u#]#repeatString(" ", 100)#</cfoutput>
<br />

<cfset i = randRange(0,255)>
<cfoutput>Byte: [#i#]#repeatString(" ", 100)#</cfoutput>
<br />

<cfset d = now()>
<cfoutput>Date: [#d#]#repeatString(" ", 100)#</cfoutput>
<br />

<cfset c = chr(randRange(65,90))>
<cfoutput>Char: [#c#]#repeatString(" ", 100)#</cfoutput>
<br />