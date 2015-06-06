<html>
<head>
<title>Arse Fish</title>

<script type="text/javascript">
	henHouse = "bum";

	function updateFullName(){
		document.frm.fullName.value = document.frm.fName.value + " " + document.frm.lName.value;
		henHouse = "hen";
		return true;
	}
	
	function checkForHen(){
		alert(henHouse);
		return true;	
	}
</script>
</head>
<body>
<form method="post" action="./act.cfm" name="frm" id="frm">
	First Name: <input name="fName" type="text" value="" onchange="updateFullName()" /><br />
	Last Name: <input name="lName" type="text" value="" onchange="updateFullName()" /><br />
	Full Name: <input name="fullName" type="text" /><br />
	<input type="button" name="henButton" value="Check Hen-house &raquo;" onclick="checkForHen()" />
	<input type="submit" name="submitButton" value="Go &raquo;" />
</form>

<form method="post" action="./act.cfm" name="frm2" id="frm2">
	First Name: <input name="fName" type="text" value="" /><br />
	Last Name: <input name="lName" type="text" value="" /><br />
	Full Name: <input name="fullName" type="text" /><br />
	<input type="button" name="henButton" value="Check Hen-house &raquo;" onclick="checkForHen()" />
	<input type="submit" name="submitButton" value="Go &raquo;" />
</form>
</html>