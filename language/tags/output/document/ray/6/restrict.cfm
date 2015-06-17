<cfdocument format="pdf" name="mydoc">

<h2>Wit and Wisdom of Paris Hilton</h2>

<p>
This space left intentionally blank.
</p>

</cfdocument>

<cfpdf	action				= "protect"
		source				= "mydoc"
		newOwnerPassword	= "opassword"
		destination			= "test2.pdf"
		overwrite			= "true"
		permissions			= "AllowAssembly,AllowFillIn,AllowModifyAnnotations,AllowModifyContents,AllowScreenReaders,AllowSecure"
>