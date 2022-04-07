<html><head>
<title>Upload</title>

<script type="text/javascript">
	function done(){
		alert("_onuploadcomplete");
		return true;
	}
</script>
</head><body>
<cffileupload	addbuttonlabel		= "_addbuttonlabel"
				bgcolor				= "CCCCCC"
				clearbuttonlabel	= "_clearbuttonlabel"
				extensionfilter		= "jpg,jpeg,png,txt"
				height				= "500"
				maxfileselect		= "10"
				maxuploadsize		= "100"
				name				= "fileUpload"
				onuploadcomplete	= "done"
				progressbar			= "true"
				title				= "_title"
				uploadbuttonlabel	= "_uploadbuttonlabel"
				url					= "./actUpload.cfm"
				width				= "500"
/>


</body>
</html>

