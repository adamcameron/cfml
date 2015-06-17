<cfparam name="URL.paras" default="1" type="integer">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head><title>title</title></head>
	<body>
	<form>
	    <cfoutput><input name="paras" type="text" value="#URL.paras#" /></cfoutput>
	</form>
 	<cfdiv	id		="myDiv2"
			bind	="cfc:shared.cf.cfml.D.div.Content.getContent({paras})"
			style	= "background-color:grey; color:white; height:100; width:200"
	/>
	</body>
</html>
