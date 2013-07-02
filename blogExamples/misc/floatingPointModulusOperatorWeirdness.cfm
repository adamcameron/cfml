<cfset theValue = 1.15>
<cfset theMultiplier = 100>
<cfset theDivisor = 5>
<cfset theProduct = theValue * theMultiplier>


<cfoutput>
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
