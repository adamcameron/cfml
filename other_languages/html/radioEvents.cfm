<cfparam name="form.displaytype" default="allcourses">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Radio Events</title>
		<script type="text/javascript">
			function f(){
				document.frmFilters.submit();
			}
		</script>
	</head>
	<body>
	<cfoutput>
		<form method="post" action="#CGi.script_name#" name="frmFilters">
			<table>
				<tr>
					<td nowrap="true">
						<input type="radio" name="displaytype" value="allcourses" onchange="f()"<cfif form.displaytype eq "allcourses"> checked="checked"</cfif> />All courses
					</td>
					<td nowrap="true">
						<input type="radio" name="displaytype" value="courses" onchange="f()"<cfif form.displaytype eq "courses"> checked="checked"</cfif> /> Relevant courses
					</td>
					<td nowrap="true">
						<input type="radio" name="displaytype" value="coursehistory" onchange="f()"<cfif form.displaytype eq "coursehistory"> checked="checked"</cfif> /> My courses
					</td>
					<td width="100%">&nbsp;</td>
				</tr>
			</table>
		</form>
	</cfoutput>
	</body>
</html>

<cfif true or structKeyExists(form, "fieldNmes")>
<cfdump var="#form#">
</cfif>