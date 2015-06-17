<cfprocessingdirective pageencoding="utf-8">
<cfparam name="form.regex" default="">
<cfparam name="form.engine" default="ColdFusion">
<cfparam name="form.method" default="Find">
<cfparam name="form.target" default="">
<cfparam name="form.replace" default="">

<cfset sFormName = "frm1">
<cfajaxproxy cfc="cf.other.regexTester.ColdFusionRegex" jsclassname="ColdFusionRegexHandler">
<cfajaxproxy cfc="cf.other.regexTester.JavaRegex" jsclassname="JavaRegexHandler">

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-type" content="text/html;charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="./regexTester.css" />
	<script type="text/javascript" src="./JavaScriptRegex.js"></script>
	<script type="text/javascript" src="./regexTester.js"></script>
	<title>Regular Expression Tester</title>
</head>
<cfoutput><body onload="initForm('#sFormName#', '#form.engine#', '#form.method#')"></cfoutput>
<cfform method="post" action="#CGI.script_name#" name="#sFormName#" id="#sFormName#">
	<p>
		Match Regular Expression:<br />
		<cfoutput><cftextarea name="regex" id="regex" tooltip="Enter your regular expression to match" cols="60" rows="6">#form.regex#</cftextarea></cfoutput>
	</p>
	<p>
		Regular Expression Controls:<br />
		<table class="plain">
		<tr>
		<td>Options:</td>
		<td>
		<cfloop index="sOption" list="i:Case-sensitive,d:Unix-lines,m:Multi-line,s:Single-line,u:Unicode case,x:Permit whitespace & comments,g:Global">
			<cfset sOptionChar = listFirst(sOption, ":")>
			<cfset sOptionTip = listLast(sOption, ":")>
			<cfparam name="form.option_#sOptionChar#" default="">
			<cftooltip tooltip="#sOptionTip#" preventoverlap="false">
				<cfinput type="checkbox" id="option_#sOptionChar#" name="option_#sOptionChar#" value="#sOptionChar#" checked="#listFindNoCase(form['option_#sOptionChar#'], sOptionChar)?true:false#" />&nbsp;
				<cfoutput><label for="option_#sOptionChar#">#sOptionChar#</label></cfoutput>&nbsp;
			</cftooltip>
		</cfloop>
		</td>
		</tr>
		<tr>
		<td>Engine:</td>
		<td>
		<cfloop index="sEngine" list="ColdFusion,Java,JavaScript">
			<cftooltip tooltip="Use #sEngine# to process regular expression" preventoverlap="false">
				<cfinput type="radio" name="engine" id="engine_#sEngine#" value="#sEngine#" checked="#(form.engine eq sEngine)?true:false#" onchange="engineChangeHandler('#sEngine#')" />&nbsp;
				<cfoutput><label for="engine_#sEngine#">#sEngine#</label></cfoutput>&nbsp;
			</cftooltip>
		</cfloop>
		</td>
		</tr>
		<tr>
		<td>Method:</td>
		<td>
		<cfloop index="sMethod" list="Find,Replace,Match">
			<cfoutput><span id="methodspan_#sMethod#"></cfoutput>
			<cftooltip tooltip="Use the #sMethod# method" preventoverlap="false">
				<cfinput type="radio" name="method" id="method_#sMethod#" value="#sMethod#" checked="#(form.method eq sMethod)?true:false#" onchange="methodChangeHandler('#sMethod#')" />&nbsp;
				<cfoutput><label for="method_#sMethod#">#sMethod#</label></cfoutput>&nbsp;
			</cftooltip>
			</span>
		</cfloop>
		</td>
		</tr>
		</table>
	</p>
	<p>
		Target String:<br />
		<cftextarea name="target" tooltip="Enter your string to test with" cols="60" rows="6"><cfoutput>#form.target#</cfoutput></cftextarea>
	</p>
	<p id="replaceControl">
		Replace Regular Expression:<br />
		<cftextarea name="replace" tooltip="Enter your regular expression to replace with" cols="60" rows="6"><cfoutput>#form.replace#</cfoutput></cftextarea>
	</p>
	<p>
		<cfinput type="button" name="btnEvaluate" value="Evaluate »" onclick="processForm()" />
	</p>
	<p>
		<cfdiv id="matchStatus"></cfdiv>
		<cfdiv id="resultTable"></cfdiv>
	</p>
</cfform>

</body>
</html>









