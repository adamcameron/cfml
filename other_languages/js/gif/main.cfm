<cfset sImgId = "img" & replace(createUuid(), "-", "", "ALL")>
<script type="text/javascript">
	<cfoutput>#sImgId#</cfoutput> = new Image();
</script>
<cfoutput><a href="./target.cfm" onclick="#sImgId#.src='./remote.cfm?file_uuid=12345678-9ABC-DEF0-1234-56789ABCDEF0&contactid=12345'">GO!</a></cfoutput>