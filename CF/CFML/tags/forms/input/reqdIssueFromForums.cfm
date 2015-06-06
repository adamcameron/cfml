<!---<cfdump var="#form#">--->

<table border="0" cellspacing="0" cellpadding="0">
	<cfform method="post" action="#CGI.script_name#">
		<tr>
			<th>Firstname</th>
			<td ><cfinput class="text-box" type="text" required="Yes" message="Please enter first name" name="name1" size="50" /></td>
		</tr>
		
		<tr>
			<th>Surname</th>
			<td ><cfinput class="text-box" type="text" required="Yes" message="Please enter second name" name="name2" size="50" /></td>
		</tr>

		<tr>
			<td> </td>
			<td colspan="2"><input type="image" src="images/click.gif" name="submit" value="Submit" /></td>
		</tr>
	</cfform>
	
</table>