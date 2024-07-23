<cfapplication name="shado" setclientcookies="yes" clientmanagement="yes" sessionmanagement="yes">
<cfcontent type="text/html; charset=UTF-8">
<cfset setEncoding("form","utf-8")>
<cfset setEncoding("url","utf-8")>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Key Generator</title>
	<link href="./styles.css" type="text/css" rel="stylesheet" />
</head>

<body>
<table width="100%" height="98%" border="0" cellspacing="0" cellpadding="0">
	<tr valign="middle">
		<td align="center">





						<cfscript>
						keys = createobject("component","shado_vk");
						session.shadoversion = "shadomx";
						</cfscript>

						<cfparam name="form.keyname" default="demoshado">
						<cfparam name="form.keytype" default="SiteKey">
						<cfparam name="form.expirydate" default="#dateadd('yyyy',50,now())#">

						<cfif not isdefined("form.testkey")>
						<cfoutput>
			<table cellspacing="0" cellpadding="50" class="border">
				<tr valign="middle">
					<td align="center">
						<strong>Key Generator</strong>
						<br />
						<table>
						<form action="index.cfm" method="post" name="makekey" id="makekey">
							<tr>
								<td>Key Name (DSN)</td>
								<td><input type="text" name="keyname" value="#form.keyname#"></td>
							</tr>

							<tr>
								<td>Key Type</td>
								<td>
								<select name="keytype">
									<option value="SiteKey" #iif(form.keytype eq "SiteKey",de("selected"),de(""))#>SiteKey</option>
									<option value="ServerKey" #iif(form.keytype eq "ServerKey",de("selected"),de(""))#>ServerKey</option>
									<option value="AdvancedDMSKey" #iif(form.keytype eq "AdvancedDMSKey",de("selected"),de(""))#>AdvancedDMSKey</option>
									<option value="AdvancedEmailKey" #iif(form.keytype eq "AdvancedEmailKey",de("selected"),de(""))#>AdvancedEmailKey</option>
									<option value="AdvancedFormBuilderKey" #iif(form.keytype eq "AdvancedFormBuilderKey",de("selected"),de(""))#>AdvancedFormBuilderKey</option>
									<option value="AdvancedGraphsKey" #iif(form.keytype eq "AdvancedGraphsKey",de("selected"),de(""))#>AdvancedGraphsKey</option>
									<option value="DeploymentKey" #iif(form.keytype eq "DeploymentKey",de("selected"),de(""))#>DeploymentKey</option>
									<option value="EventsCalendarKey" #iif(form.keytype eq "EventsCalendarKey",de("selected"),de(""))#>EventsCalendarKey</option>
									<option value="MultilanguageKey" #iif(form.keytype eq "MultilanguageKey",de("selected"),de(""))#>MultilanguageKey</option>
									<option value="NewsModuleKey" #iif(form.keytype eq "NewsModuleKey",de("selected"),de(""))#>NewsModuleKey</option>
									<option value="OnlinePollKey" #iif(form.keytype eq "OnlinePollKey",de("selected"),de(""))#>OnlinePollKey</option>
									<option value="PermissionsKey" #iif(form.keytype eq "PermissionsKey",de("selected"),de(""))#>PermissionsKey</option>
									<option value="PortalKey" #iif(form.keytype eq "PortalKey",de("selected"),de(""))#>PortalKey</option>
									<option value="SEOKey" #iif(form.keytype eq "SEOKey",de("selected"),de(""))#>SEOKey</option>
									<option value="ServerKeyDevelopmentOnly" #iif(form.keytype eq "ServerKeyDevelopmentOnly",de("selected"),de(""))#>ServerKeyDevelopmentOnly</option>
									<option value="SimpleFormBuilderKey" #iif(form.keytype eq "SimpleFormBuilderKey",de("selected"),de(""))#>SimpleFormBuilderKey</option>
									<option value="TMSKey" #iif(form.keytype eq "TMSKey",de("selected"),de(""))#>TMSKey</option>
									<option value="ZoomFlexGeneratorKey" #iif(form.keytype eq "ZoomFlexGeneratorKey",de("selected"),de(""))#>ZoomFlexGeneratorKey</option>
								</select>
								</td>
							</tr>

							<tr>
								<td>Key Expiry</td>
								<td>
								<cfset theDate = createObject("component", "misc").shadoDate(date=dateadd('yyyy',50,now()), formName="makekey", fieldName="expirydate")>
								<cfoutput>#theDate.value#</cfoutput>
								<!--- <cf_shado_date formname="makekey" fieldname="expirydate" date="#dateadd('yyyy',50,now())#"> --->
								</td>
							</tr>

							<tr>
								<td>Create Key</td>
								<td><input type="submit" name="go" value="Create Key"></td>
							</tr>
						</form>
						</table>
					</td>
				</tr>
			</table>
						</cfoutput>
						</cfif>
						<cfif isdefined("form.go")>
<!--- 						<cfdump var="#form#"><cfabort> --->
							<cfset thisdate = createodbcdatetime(createdate(form.expirydate_year,form.expirydate_month,form.expirydate_day))>

							<cfset result = keys.createKey(keyname=form.keyname,keyType=form.keyType,keyExpiry=thisdate)>
						<cfoutput>
						<br>
						<br>

			<table cellspacing="0" cellpadding="50" class="border">
				<tr valign="middle">
					<td align="center">
						<strong>Key Tester</strong>
						<br />
						<table>
						<form action="index.cfm" method="post" name="test" id="test">
							<tr>
								<td>Key Name (DSN)</td>
								<td><input type="text" name="keyname" value="#form.keyname#"></td>
							</tr>
							<tr>
								<td>Key</td>
								<td><textarea cols="60" rows="6" name="key">#result.value#</textarea></td>
							</tr>
							<tr>
								<td>Test Key</td>
								<td><input type="submit" name="testkey" value="Test This Key"></td>
							</tr>

						</form>
						</table>
						</cfoutput>

					</td>
				</tr>
			</table>
						</cfif>


						<cfif isdefined("form.testkey")>
						<br><br>
			<table cellspacing="0" cellpadding="50" class="border">
				<tr valign="middle">
					<td align="center">
						<strong>Key Test Results</strong>
						<br />
							<cfset dec = keys.decipherKey(key=form.key,keyname=form.keyname)>
							<cfdump var="#dec#">

							<a href="index.cfm">Create New Key</a><br>
							<a href="javascript:history.back()">back</a>
					</td>
				</tr>
			</table>
						</cfif>


			<!--- end login area --->
		</td>
	</tr>
</table>

</body>
</html>
