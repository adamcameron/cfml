<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-type" content="text/html;charset=UTF-8" /> 
	<title>&lt;cffileupload&gt; tests</title>
	
	<script type="text/javascript">
		function onCompleteHandler(result){
			for (var property in result){
				alert(property + "; " +  result[property]);
			}
			alert("Status: " + result.STATUS + ";\nMessage: " + result.MESSAGE + ";\nFilename: " + result.FILENAME);
		}

		function onErrorHandler(result){
			for (var property in result){
				alert(property + "; " +  result[property]);
			}
			alert("Status: " + result.STATUS + ";\nMessage: " + result.MESSAGE + ";\nFilename: " + result.FILENAME);
			return true;
		}
	</script>
</head>
<body>
<cffileupload name="upl1" url="./actUploadOne.cfm" onerror="onErrorHandler" onComplete="onCompleteHandler" stoponerror="true">
</body>
</html>
