<cfparam name="URL.s" default="">
<script type="text/javascript">
	oRegex =  new RegExp("^[-a-zA-Z0-9_]+[-a-zA-Z0-9$_]*$");

	s = prompt("Enter a string", "<cfoutput>#URL.s#</cfoutput>");
	alert(oRegex.test(s));
</script>