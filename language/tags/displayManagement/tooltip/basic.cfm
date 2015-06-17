<cfif structKeyExists(URL, "tipsrc") and isBoolean(URL.tipsrc) and URL.tipsrc>
	Here's more Minky:<br />
	<img src="/shared/cf/cfml/S/select/MonkeyBride3_thumb.jpg" alt="Mink" />

<cfelse>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
		<head><title>title</title></head>
		<body>
			<cftooltip tooltip="It's Minky!">
				<img src="/shared/cf/cfml/S/select/MonkeyBride1_thumb.jpg" alt="Mink" />
			</cftooltip>
			<br />
			<cftooltip sourceForTooltip="#cgi.script_name#?tipsrc=true" preventOverlap="false" showdelay="0" hideDelay="0">
				<img src="/shared/cf/cfml/S/select/MonkeyBride2_thumb.jpg" alt="Mink" />
			</cftooltip>
		</body>
	</html>
</cfif>