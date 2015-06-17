<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>CFC tmt_java_regexp sample</title>
</head>

<body>
<cfset regExpObj=CreateObject("component","tmt_java_regexp")>

Test (case sensitive): <cfoutput>#regExpObj.regExpTest("\w*.cfm$", "myfile.Cfm")#</cfoutput>
<br />
Test (case insensitive): <cfoutput>#regExpObj.regExpTest("(?i)\w*.cfm$", "myfile.Cfm")#</cfoutput>

<br />
<br />

<cfset cardStr = "card: 1234-5678-9123">
<cfset cardPattern = "\d{4}">
Replace all: <cfoutput>#regExpObj.regExpReplace(cardPattern, cardStr, "xxxx", true)#</cfoutput>
<br />
Replace first: <cfoutput>#regExpObj.regExpReplace(cardPattern, cardStr, "xxxx")#</cfoutput>

<br />
<br />

<cfset namesStr = "Pippo pappo puppo, 123">
<cfset namesPattern = "(?i)(p\w*)\s(p\w*)\s(p\w*)">
Match as strings: <cfdump var="#regExpObj.regExpExec(namesPattern, namesStr)#">
<br />
Match as structs: <cfdump var="#regExpObj.regExpExec(namesPattern, namesStr, 1)#">

<br />
<br />

<cfset myStr="1 Pippo 2 Pippi 3 Pippe">
<cfset myPattern="(\d)\sPipp(\w)*\s?">
Matches as strings: <cfdump var="#regExpObj.regExpMatches(myPattern, myStr)#">
<br />
Matches as structs: <cfdump var="#regExpObj.regExpMatches(myPattern, myStr, 1)#">

</body>
</html>
