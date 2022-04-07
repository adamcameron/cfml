<html>
	<head><title>Won't See This</title></head>
	<body>
		<h1>Won't See This Either</h1>
		<cflocation URL="./target.cfm" addtoken="false">
		<p>Or this</p>
		<cffile action="write" file="#expandPath('./')#AfterCflocation.dat" output="But this gets created.">
	</body>
</html>