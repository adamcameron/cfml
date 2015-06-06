<cfscript>
	sMsg = "
		message
		from
		CF
	";
</cfscript>
<script type="text/javascript">
	function f(){
		var sMsg = "\
			message\
			from\
			JavaScript\
		"
		alert(sMsg)
	}

</script>
<cfoutput>#sMsg#</cfoutput>
<br />
<input type="button" value="Click Me" onclick="f()" />
