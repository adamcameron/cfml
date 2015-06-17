<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>Untitled Document</title>
</head>

<body>
<cflayout type="hbox" style="background-color:##CCffFF; color:red;">
    <cflayoutarea>
        <cfpod name="pod01" source="displayforpod.cfm?start=1" height="500" width="300" title="Comment 1" />
    </cflayoutarea>
    <cflayoutarea>
        <cfpod name="pod02" source="displayforpod.cfm?start=2" height="500" width="450" title="Comment 2" />
    </cflayoutarea>
    <cflayoutarea>
        <cfpod name="pod03" height="500" width="450" title="Comment 3">
			pods
		</cfpod>
    </cflayoutarea>
</cflayout>
</body>
</html>