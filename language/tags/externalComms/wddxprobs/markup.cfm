<cfset st = structNew()>
<cfset st.hDoc = '
<html>
	<head><title>Hello World</title></head>
	<body>
		<h1>Hello World</h1>
		<p>Hello<br />World</p>
	</body>
</html>	
'>

<cfloop index="i" from="1" to="#len(st.hDoc)#">
	<cfset c = mid(st.hDoc, i, 1)>
	<cfset a = asc(c)>
	<cfif xmlFormat(c) neq c>
		<cfset s = ' style="color:red;"'>
	<cfelse>
		<cfset s = ' style="color:green;"'>
	</cfif>
	<cfoutput><div#s#>[#i#][#c#][#a#]</div></cfoutput>
</cfloop>




<!--- <cfxml variable="st.xDoc">
	<root><parent><child/></parent></root>
</cfxml>

<cfwddx action="cfml2wddx" input="#st#" output="wDoc">
<cfoutput>#wDoc#</cfoutput>
 --->
		
			
