<cfset fFirst = 2.5 * 5.0>
<cfset iSecond = 20>
 
<cfset iMax = max(javacast("int", iSecond), javacast("int", iSecond-fFirst))>
<cfoutput>
iMax: #iMax#<br />
compare: #compare("#iMax#", "20.0")#<br /> 
.getClass().getName(): #iMax.getClass().getName()#<br /> 
</cfoutput>

<cfset oCV = createObject("java","ClassViewer")>
<pre>
<cfoutput>#oCV.viewObject(iMax)#</cfoutput>
</pre>