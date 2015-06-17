<cfscript>
	q = queryNew("value,label");
	queryAddRow(q);	querySetCell(q, "value", 1); querySetCell(q, "label", "one");
	queryAddRow(q);	querySetCell(q, "value", 2); querySetCell(q, "label", "two");
	queryAddRow(q);	querySetCell(q, "value", 3); querySetCell(q, "label", "three");
	queryAddRow(q);	querySetCell(q, "value", 4); querySetCell(q, "label", "four");
	queryAddRow(q);	querySetCell(q, "value", 5); querySetCell(q, "label", "five");
</cfscript>

<cfform method="post" action="" name="frmTest">
	<cfselect name="mySelect" id="mySelect" value="value" display="label" required="yes" query="q" message="oi!">
		<option value="">Select one</option>
	</cfselect>
	<br />
	<input type="submit" name="btnSubmit" value="Go &raquo;">
</cfform>
<script type="text/javascript">
<!--
document.frmTest.mySelect.selectedIndex=-1;
//-->
</script>
<cfdump var="#form#">
