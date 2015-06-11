<!---<cfscript>
 	inputAttr['value'] = "Some string value";
 	inputAttr['type'] = "text";
 	tagAttr = 'tControlName';
 </cfscript>
<html>
<head>
<title>title</title>
</head>
<body>
<cfform name="fTest" method="post" action="">
 	<cfloop collection=#inputAttr# item="attr">
 		 <cfset tagAttr = '#tagAttr#" #attr#="#inputAttr[attr]#'>
 	</cfloop>
 	<cfset tagAttr = '#tagAttr#"'>
 	<cfoutput>#tagAttr#<br /></cfoutput>
 	<cfinput name="#tagAttr#" />
 </cfform>
</body>





 ---><!DOCTYPE HTML PUBLIC
"-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>title</title>
</head>
<body>
<cfset spoofSize='40" maxlength="10" value="fieldValue" tabindex="1'>
<cfform name="fTest" method="post" action="">
	<cfinput name="formField" size="#spoofSize#" />
</cfform>
</body>
</html>