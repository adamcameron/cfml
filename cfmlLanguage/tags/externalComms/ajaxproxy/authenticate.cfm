<cfajaxproxy cfc="shared.cf.cfml.A.ajaxproxy.Authentication" jsclassname="AuthProxy">
<html>
	<head>
		<title>cfajaxproxy test</title>
		<script type="text/javascript">
			function getAuthentication(){
				var oAuthProxy = new AuthProxy();
				oAuthProxy.setCallbackHandler(showAuthentication);
				oAuthProxy.authenticate(document.frm1.userId.value, document.frm1.password.value);
			}

			function showAuthentication(result) {
				if (result){
					document.getElementById('authStatus').innerHTML = '<span style="color:green;">Authentication OK</span>';
				}else{
					document.getElementById('authStatus').innerHTML = '<span style="color:red;">Authentication FAILED</span>';
				}
			}

			function clearMessage(){
				document.getElementById('authStatus').innerHTML = "";
			}
		</script>
	</head>
	<body>
		<form name="frm1" action="./caller.cfm">
			<table>
				<tr><td>User ID</td><td><input type="text" name="userId" id="userId" value="" onfocus="clearMessage()" /></td></tr>
				<tr><td>Password</td><td><input type="password" name="password" id="password" value="" onfocus="clearMessage()" /></td></tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="button" name="btnAuthenticate" id="btnAuthenticate" value="Authenticate &raquo;" onclick="getAuthentication()" /></td>
				</tr>
				<tr><td colspan="2"><div id="authStatus"></div></td></tr>
			</table>
		</form>
	</body>
</html>