<form action="http://www.straker.co.nz/shadomx/apps/fms/admin/index.cfm?shadoaction=act_createfile" method="post" enctype="multipart/form-data" name="frmFileUpload" id="frmFileUpload">
<!--- 	<form action="http://demo75.strakersolutions.com/shadomx/shado_central/ui/urlproxy.cfm?urlstring=/shadomx/apps/fms/admin/index.cfm?shadoaction=act_createfile" method="post" enctype="multipart/form-data" name="frmFileUpload" id="frmFileUpload"> --->
		<table width="400">
			<tr>
				<td valign="top" class="data"><strong>File:</strong></td>
			<td>

				<input type="file" name="uploadfile" id="uploadfile" size="40">
			</td>
		</tr>
		<tr>
			<td valign="top" class="data"><strong>Title</strong>:</td>
			<td>
				<input type="Text" name="title" maxlength="255" size=40 required="No" >
				<br /><span class="data">The file name is used as the title if this field is left blank.</span>

			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td>
				<input type="submit" value="Create &raquo;" class="stdButton" onClick="return checkFile();">
			</td>
		</tr>
		</table>

		<input type="hidden" name="path" value="">
		
			<input type="hidden" name="inheritedrights" value="" />
		
	</form>
