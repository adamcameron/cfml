<cfset crlf = Chr(13) & Chr(10)>
<cfset tab = chr(09)>
<cfset testingwithwhitespace = crlf & tab & tab & "Value With Tabs and Spaces" & crlf & tab & tab & crlf & tab & tab & crlf>
<cfset testingwithoutwhitespace = "Value Without Tabs and Spaces">
<cfsavecontent variable="testingHTML">


                             <html>
                                     <head>
                                                <title>White Space Test</title>
                                     </head>
                                     <body>
                                                <div>White Space Test</div>
                                     </body>
                             </html>



</cfsavecontent>
<cfset qryTesting = QueryNew("Description,testvalue")>
<cfset rowid = queryAddRow(qryTesting)>
<cfset querySetCell(qryTesting,"Description","Testing String with whitespace",rowid)>
<cfset querySetCell(qryTesting,"testvalue",testingwithwhitespace,rowid)>
<cfset rowid = queryAddRow(qryTesting)>
<cfset querySetCell(qryTesting,"Description","Testing HTML",rowid)>
<cfset querySetCell(qryTesting,"testvalue",testingHTML,rowid)>

<h1 align="center">Before Query of Query</h1>
<cfoutput query="qryTesting">
#qryTesting.description#<hr />
<span style="background:yellow">#HTMLCodeFormat(qryTesting.testvalue)#</span><br /><br />
</cfoutput>

<cfquery dbtype="query" name="qofqAutoTrim">
SELECT Description,testvalue
FROM qryTesting
</cfquery>
<h1 align="center">After Query of Query</h1>
<cfoutput query="qofqAutoTrim">
#qofqAutoTrim.description#<hr />
<span style="background:yellow">#HTMLCodeFormat(qofqAutoTrim.testvalue)#</span><br /><br />
</cfoutput>