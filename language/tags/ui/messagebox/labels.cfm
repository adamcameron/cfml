<cfmessagebox	name		= "msgbx1"
				type		= "alert"
				message		= "Tell me something"
				labelcancel	= "xCancel"
				labelyes	= "xYes"
				labelno		= "xNo"
				labelok		= "xOk"	
 />

<input type="button" name="btn1" id="btn1" value="Click me" onclick="ColdFusion.MessageBox.show('msgbx1')" />


