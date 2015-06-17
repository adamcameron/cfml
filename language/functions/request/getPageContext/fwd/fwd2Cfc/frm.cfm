<cfset session.mySessionVar = "SESSION: " & timeFormat(now(), "HH:MM:SS.LLL")>
<cfset application.myAppVar = "APPLICATION: " & timeFormat(now(), "HH:MM:SS.LLL")>
<form method="post" action="./act.cfm">
	<input type="text" name="txt1" value="" /><br />
	CFM:<input type="radio" name="fwdType" value="CFM"/><br />
	CFC:<input type="radio" name="fwdType" value="CFC"/><br />
	<input type="submit" name="btnSubmit" value="Go &raquo;" />	
</form>