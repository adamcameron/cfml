<cfform action="act.cfm" method="post" preloader="no" lang="en" dir="ltr" title="test" enctype="multipart/form-data">
	Select the type of link you are adding:<br>
	Club <cfinput type="radio" name="type" visible="true" checked="true" value="1">
	Equpiment vendor/reseller <cfinput type="radio" name="type" visible="yes" checked="no" value="2">
	<br>
	<table width="95%" border="0">
		<tr>
			<td>Link Contact Person:</td>
			<td><cfinput type="text"  name="linkContact" size="25" maxlength="30"></td>
		</tr>
		<tr>
			<td>Club Address:</td>
			<td><cfinput type="text" name="linkAddress" size="30" maxlength="40"></td>
		</tr>
		<tr>
			<td>Club City:</td>
			<td><cfinput type="text" name="linkCity" size="15" maxlength="20"></td>
		</tr>
		<tr>
			<td>Club State:</td>
			<td><cfinput type="text" name="linkStat" size="2" maxlength="2" style="text-transform:uppercase"></td>
		</tr>
		<tr>
			<td>Club Zip:</td>
			<td><cfinput type="text" name="linkZip" size="5" maxlength="5"></td>
		</tr>
		<tr>
			<td>A float:</td>
			<td><cfinput type="text" name="myFloat" required="Yes" validate="float" message="Unit Value must be entered and must be numeric."></td>
		</tr>

		<tr>
			<td>Upload a club logo?</td>
			<td><cfinput type="file" name="linkLogo"></td>
		</tr>
	</table>
	<p align="center"><cfinput type="submit" name="Submit" value="Submit"></p>
</cfform>
