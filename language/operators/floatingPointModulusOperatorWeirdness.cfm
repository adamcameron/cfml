<cfoutput>
<cfif structKeyExists(server, "railo")>
	server.railo.version: #server.railo.version#<br>
<cfelse>
	server.coldFusion.productVersion: #server.coldFusion.productVersion#<br>
</cfif>
<hr>

<cfset theValue = 1.15>
<cfset theMultiplier = 100>
<cfset theDivisor = 5>
<cfset theProduct = theValue * theMultiplier>


Default<br>
#theProduct# % #theDivisor# = #theProduct % theDivisor#<br>
#theProduct# / #theDivisor# = #theProduct / theDivisor#<br>
#theProduct# \ #theDivisor# = #theProduct \ theDivisor#<br>
<hr>

Precision<br>
<cfset thePreciseProduct = precisionEvaluate(theValue * theMultiplier)>
#thePreciseProduct# % #theDivisor# = #thePreciseProduct % theDivisor#<br>
#thePreciseProduct# / #theDivisor# = #thePreciseProduct / theDivisor#<br>
#thePreciseProduct# \ #theDivisor# = #thePreciseProduct \ theDivisor#<br>
<hr>
</cfoutput>

<cfexit>
<cfoutput>
Java<br>
<cfset theJavaVersion = createObject("java", "java.lang.Double").init(theValue*theMultiplier)>
Output: #theJavaVersion#<br>
toString(): #theJavaVersion.toString()#<br>
</cfoutput>
<hr>


Javascript<br>
<script>
	theValue = 1.15;
	theMultiplier = 100;
	theDivisor = 5;
	theProduct = theValue * theMultiplier;

	document.write(theProduct + " % " + theDivisor + " = " + (theProduct % theDivisor) + "<br>");
	document.write(theProduct + " / " + theDivisor + " = " + (theProduct / theDivisor) + "<br>");
</script>
