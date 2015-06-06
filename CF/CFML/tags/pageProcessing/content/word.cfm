<cfheader name="Content-Disposition" value="filename=HelloWorld.doc">
<cfcontent type="application/msword">

<link rel="stylesheet" href="./test.css">
<style>
table {
	background-color: Silver;
	border: 1px;
	color: Green;
}
</style>

<table border="1">
	<tr>
		<td>Hello</td>
	</tr>
	<tr>
		<td>World</td>
	</tr>
</table>