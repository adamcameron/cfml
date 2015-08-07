<cfset cv = createObject("java", "me.adamcameron.miscellany.ClassViewer")>

<cfscript>
	a = arrayNew(1);
	a[1] = "one";
	a[3] = "three";
	a[5] = "five";
	a[7] = "seven";
	a[9] = "nine";
	l1 = a.ArrayToList(a,",");
	l2 = arrayToList(a);
</cfscript>

<pre>
<cfoutput>
#cv.viewObject(a)#
</cfoutput>
</pre>
<cfdump var="#a#"><br />
<cfdump var="#l1#"><br />

<cfset a[2] = "two">
<cfdump var="#l1#"><br />


<cfdump var="#l2#"><br />
<cfdump var="#a.indexOf('three')#"><br />

<cfsetting showdebugoutput="no">