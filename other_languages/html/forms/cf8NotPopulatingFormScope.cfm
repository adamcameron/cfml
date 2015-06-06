<cfoutput>

<cfdump var="#form#" label="form">

<cfset st = getHttpRequestData()>
<cfdump var="#st#" label="getHttpRequestData()">
<cfloop item="sKey" collection="#st#">
<cfif isStruct(st[sKey])>
<cfloop item="sHeaderKey" collection="#st[sKey]#">
st[#sKey#][#sHeaderKey#] = #st[sKey][sHeaderKey]#<br />
</cfloop>
<cfelse>
st[#sKey#] = #st[sKey]#<br />
</cfif>
</cfloop>
<hr />
<form action="#CGI.script_name#" method="post" name="frm1">
<input type="text" name="txt1" value="" size="60" /><br />
<input type="text" name="txt2" value="#getTickCount()#" size="60" /><br />
<input type="text" name="txt3" value="#createUuid()#" size="60" /><br />
<input type="submit" name="btnSubmit1" value="Submit" />
</form>
</cfoutput>