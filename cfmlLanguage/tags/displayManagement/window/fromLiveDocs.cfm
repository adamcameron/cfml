<html>
<head><title>&lt;CFWINDOW&gt; example</title></head>

<body>
<cfform name="myform">
	<cfinput type="hidden" name="hiddentext" value="This is hidden text from the main page" />

	Click the mouse on the control to show its text in window 1.
	<cfinput name="text1" /><br />

	Click the button to show the input control text in window 2.
	<cfinput name="text2" />
	<cfinput type="button" name="mybutton" value="Show Text" onclick="javascript:ColdFusion.Window.show('mywindow2')" /><br />

	Click the Checkbox to change and show its status in window 3
	<cfinput name="check1" type="checkbox" /><br />

	Click the button to open a window containing the page specified by the input control.
	<cfinput name="text3" value="windowsource.cfm" />
	<cfinput type="button" name="mybutton3" value="Open Window"	onclick="javascript:ColdFusion.Window.show('mywindow4')" />
</cfform>

<!---
	This window shows initially and cannot be closed, dragged, or resized.
	The value of the text URL parameter, and therefore, the contents of the
	text displayed in the window changes each time the user clicks the
	mouse over the text1 control.
--->
<cfwindow	x			= "0"
			y			= "100"
			width		= "200"
			height		= "150"
			name		= "mywindow"
			title		= "My First Window"
			closable	= "false"
			draggable	= "false"
			resizable	= "false"
			initshow	= "true"
        	source		= "windowsource.cfm?text={myform:text1@mousedown}"
/>

<!---
	This window shows initially and cannot be dragged, or resized, but can
	be closed.
	The text URL parameter represents the text2 input control value.
--->
<cfwindow	x			= "0"
			y			= "250"
			width		= "200"
			height		= "150"
			name		= "mywindow2"
			title		= "My Second Window"
			initshow	= "true"
			draggable	= "false"
			resizable	= "false"
			source		= "windowsource.cfm?text={myform:text2}"
/>

<!---
	This window shows initially and cannot be resized, but can be dragged
	or closed.
	The value of the text URL parameter, and therefore, Boolean value
	displayed in the window changes each time the user clicks the mouse
	in the check1 control to change the check box status.
	The bind expression binds to the check box checked attribute;
	it specifies a click event because Internet Explorer does not
	generate a change event when the user clicks the box.
--->
<cfwindow	x			= "0"
			y			= "400"
			width		= "200"
			height		= "150"
			name		= "mywindow3"
			title		= "My Third Window"
			initshow	= "true"
			resizable	= "false"
			source		= "windowsource.cfm?text=<b>Checkbox: </b>{myform:check1.checked@click}"
/>

<!---
	This window does not display initially.
	The Open Window button control opens it.
	It can be closed, dragged, and resized.
	The value text URL parameter represents the value of a hidden text
	field.
--->
<cfwindow	x			= "210"
			y			= "100"
			width		= "500"
			height		= "480"
			name		= "mywindow4"
        	<!--- minHeight	= "400" --->
			<!--- minWidth	= "400" --->
        	title		= "My Fourth Window"
			initshow	= "false"
			modal		= "true"
			draggable	= "false"
			resizable	= "false"
			source		= "{myform:text3}?text={myform:hiddentext}&windowname=mywindow4"
/>
</body>
</html>

