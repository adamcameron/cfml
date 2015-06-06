<cfscript>
	oException = createObject("java","java.lang.Exception").init();
	aStack = oException.getStackTrace();
	easyToSpotFunctionName();
</cfscript>
<cfdump var="#oException#">


<cfloop index="i" from="1" to="#arrayLen(aStack)#">
<cfoutput>#aStack[i].getFileName()# (#aStack[i].getLineNumber()#)<br /></cfoutput>
</cfloop>

<cffunction name="easyToSpotFunctionName">
<cfscript>
	var oException = createObject("java","java.lang.Exception").init();
	var aStack = oException.getStackTrace();
	var i = 0;
</cfscript>
<cfloop index="i" from="1" to="#arrayLen(aStack)#">
<cfoutput>#aStack[i].getFileName()# (#aStack[i].getLineNumber()#)<br /></cfoutput>
</cfloop>
</cffunction>