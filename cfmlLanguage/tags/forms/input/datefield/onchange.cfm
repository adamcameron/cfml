<cfform>
<cfinput type="datefield" name="testDate" id="testDate"  size="10" onchange="alert(document.getElementById('testDate').value)">
<input type="text" name="std1" id="std1" value="Starting value" onchange="javascript:alert('foo!')" />
<input type="button" name="btn1" value="Click Me" onclick="javascript:document.getElementById('std1').value = 'New Value'" />
</cfform>