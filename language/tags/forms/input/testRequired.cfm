<html>
<head><title>Title</title></head>
<body>
<cfform method="post" action="./testRequired.cfm" format="html">

<cfinput type="text" name="PubTitle" message="You must enter a publication title." size="30" maxlength="255"
class="inputbox" required="yes">
<cfinput type="submit" name="submitButton" value="Go &raquo;">
<input type="submit" name="submitButton" value="Go &raquo;">
</cfform>
</body>
</html>