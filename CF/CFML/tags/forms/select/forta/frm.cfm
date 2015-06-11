<cfform>

<table>
	 <tr>
			<td>Select Media Type:</td>
			<td><cfselect name="mediaid" bind="cfc:art.getMedia()" bindonload="true" /></td>
	 </tr>
	 <tr>
			<td>Select Art:</td>
			<td><cfselect name="artid" bind="cfc:art.getArt({mediaid})" /></td>
	 </tr>
</table>

</cfform>