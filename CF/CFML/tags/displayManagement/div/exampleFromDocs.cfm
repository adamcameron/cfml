<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>cfdiv Example</title>
</head>

<body>
<form name="frm1" id="frm1">
    <input name="tinput1" type="text" id="inpId">
</form>

<h3> using a div</h3>
<cfdiv bind="url:divsource.cfm?InputText={inpId}" ID="theDiv" style="background-color:##CCffFF; color:red; height:350"/>
</body>
</html>
