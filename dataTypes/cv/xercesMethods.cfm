<cfset oCv = createObject("java", "ClassViewer")>
<cfxml variable="x">
	<html>
		<head>
		</head>
		<body>
			<div id="a">
		</body>
	</html>
</cfxml>
<pre>
<cfoutput>#oCv.viewObject(x.getImplementation().getDOMImplementation())#</cfoutput>
</pre>
