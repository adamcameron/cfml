<cfscript>
	cD = chr(31);
	l = "";
	
	l = listAppend(l, "a", cD);
	l = listAppend(l, "b", cD);
	l = listAppend(l, "c", cD);
	l = listAppend(l, "d", cD);
	l = listAppend(l, "e", cD);
</cfscript>

<script type="text/javascript">
	var l = "<cfoutput>#l#</cfoutput>";
	var a = l.split("\x1F");
	
	for (var i=0; i < a.length; i++){
		alert(a[i]);
	}
</script>