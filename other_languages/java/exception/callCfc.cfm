<cfset o = createObject("component", "c")>
<cfset e = o.originalMethodName()>
<cfset aStack = e.getStackTrace()>

<cfdump var="#aStack#">
<cfoutput>
<cfloop index="i" from="1" to="#arrayLen(aStack)#">
	getClassName(): [#aStack[i].getClassName()#]<br />
	getFileName(): [#aStack[i].getFileName()#]<br />
	getLineNumber(): [#aStack[i].getLineNumber()#]<br />
	getMethodName(): [#aStack[i].getMethodName()#]<br />
	<hr />
</cfloop>
</cfoutput>


<cfset pointertoMethod = o.originalMethodName>
<cfset e = pointertoMethod()>
<cfset aStack = e.getStackTrace()>

<cfdump var="#aStack#">
<cfoutput>
<cfloop index="i" from="1" to="#arrayLen(aStack)#">
	getClassName(): [#aStack[i].getClassName()#]<br />
	getFileName(): [#aStack[i].getFileName()#]<br />
	getLineNumber(): [#aStack[i].getLineNumber()#]<br />
	getMethodName(): [#aStack[i].getMethodName()#]<br />
	<hr />
</cfloop>
</cfoutput>
