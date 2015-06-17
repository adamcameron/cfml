<script type="text/javascript">
	function inc(){
		document.frm1.count.value++
	}
</script>

<cfset createObject("java", "java.lang.Thread").sleep(3000)>
<cfform method="post" action="./submitOnce.cfm" name="frm1">
	<input type="text" name="name" value="" />
	<input type="text" name="count" value="0" />
	<cfinput value="Submit" type="submit" name="btnSubmit" validate="submitonce" onclick="inc()" />
</cfform>

<cfdump var="#form#">