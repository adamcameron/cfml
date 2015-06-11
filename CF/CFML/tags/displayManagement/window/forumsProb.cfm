<html>
<head>
<title>Calm down please</title>
<link href="http://www.kyndoutdoors.com/newsite/_kynd-css/main.css" rel="stylesheet" type="text/css" item="text/css">
</head>
<body>
<table cellpadding="12" border="2" width="50%">
<tr>
 <td align="center"><h3>Testing</h3></td>
</tr>
<tr>
 <td align="center"><h2>This table should have a cellpadding of 12.  This page does contain a cfwindow include.</h4><a href="##" onClick="javascript:ColdFusion.Window.show('water_window')">Click here</a> to see the window</td>
</tr>
<tr>
 <td align="center">*Please not that the page looks strange inside the browser window (different at the top and left inside the browser) in addition to losing the padding when cfwindow is included.</td>
</tr>
</table>
</body>
</html>
 
<cfajaximport tags="cfwindow"/>
<!---<cfwindow
name="water_window"
center="true"
modal="true"
resizable="false"
draggable="false"
height="500"
width="500"
closable="true"
initshow="false"
refreshonshow="true"
source="cfwindow.cfm"/>--->